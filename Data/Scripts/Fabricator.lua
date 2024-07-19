---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---@type Factory_Item
local Factory_Item = require(script:GetCustomProperty("Factory_Item"))

---The Fabricator is responsible for spawning items onto the belt. It will look for
---a belt below the spawn point of the item. If it finds one it will send the item
---to the belt machine which will handle the next task.
---@class Fabricator
local Fabricator = Class("Fabricator", Factory_Machine)

function Fabricator:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)
	
	---The type of machine this class is.
	---@type string
	self.type = Factory.Machine_Type.FABRICATOR

	---The item to spawn.
	---@type string|nil
	self.item = nil

	---The drop speed of the item.
	---@type number
	self.drop_speed = 1

	---The delay between each item spawning.
	---@type number
	self.spawn_interval = 1

	---The max drop distance of the item.
	---@type number
	self.drop_distance = 300

	---The start point of the raycast. This is an object inside the belt collider.
	---@type SmartObject|nil
	self.start_point = nil

	---Position of the item spawn point.
	---@type Vector3
	self.start_position = Vector3.ZERO

	---Min item scale size. 
	---@type number
	self.min_item_size = 1

	---Max item scale size.
	---@type number
	self.max_item_size = 1

	---Max items that this fabricator will spawn.
	---@type integer
	self.max_items = -1

	---The machine that is connected to the fabricator. This should only be a belt for now.
	---@type Factory_Machine
	self.machine = nil

	---The end point of where the item needs to go. This is fetched from the connected machine.
	---@type CoreObject
	self.item_end_point = nil

	---The end position of where the item will go to on the belt.
	---@type Vector3
	self.item_end_position = Vector3.ZERO

	---The start position of the item on the belt.
	---@type Vector3
	self.item_start_position = Vector3.ZERO

	self.spawned = 0

	self.scale_item = false

	self:init()

	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Fabricator:init()
	self.item = self.root:GetCustomProperty("Item")
	self.drop_speed = self.root:GetCustomProperty("DropSpeed")
	self.spawn_interval = self.root:GetCustomProperty("SpawnInterval")
	self.drop_distance = self.root:GetCustomProperty("DropDistance")
	self.min_item_size = self.root:GetCustomProperty("MinItemSize")
	self.max_item_size = self.root:GetCustomProperty("MaxItemSize")
	self.max_items = self.root:GetCustomProperty("MaxItems")
	self.start_point = self.script:GetCustomProperty("StartPoint"):WaitForObject()
	self.start_point_position = self.start_point:GetWorldPosition()
	self.scale_item = self.root:GetCustomProperty("ScaleItem")
	self.spawned = 0
end

function Fabricator:create()
	self:find_machine()
end

---Attempts to find a machine that is connected to this fabricator. It does this by
---raycasting down. When the item drops, it will tween to the impact position.
---This is a one time call, after that the info is cached to prevent repeated raycast calls.
function Fabricator:find_machine()
	local hit = World.Raycast(self.start_point_position, Vector3.New(self.start_point_position.x, self.start_point_position.y, self.start_point_position.z - self.drop_distance), self.raycast_debug)

	if(hit ~= nil and Object.IsValid(hit.other)) then
		Factory.fetch_machine(hit.other, function(machine)
			self.machine = machine
			if(self.machine ~= nil and self.machine:get_type() == Factory.Machine_Type.BELT) then
				self.item_end_point = self.machine:get_item_end_point()

				if(Object.IsValid(self.item_end_point)) then
					self.item_start_position = hit:GetImpactPosition()
					self.item_end_position = self.item_end_point:GetWorldPosition()

					self:create_items()
				end
			end
		end)
	end
end

---Spawns a task that will create items that will be dropped from this fabricator.
---After each item tween is finished, it will register the item with the belt machine
---which will then take over the item.
function Fabricator:create_items()
	local t = Task.Spawn(function()
		if(Object.IsValid(self.item_end_point)) then
			local item_row = self:get_item(self.item)
			local item = World.SpawnAsset(self.item, {

				position = self.start_point_position + item_row.SpawnOffset,
				networkContext = NetworkContextType.LOCAL_CONTEXT

			})

			self.spawned = self.spawned + 1
			
			local pos = item:GetWorldPosition()
			local the_scale = Vector3.ONE
			
			if(self.scale_item) then
				the_scale = Vector3.ONE * Utils.random_float(self.min_item_size, self.max_item_size)
			end

			---@type Factory_Item
			local factory_item = Factory_Item:new(item, self.item)

			Factory.register(factory_item, Factory.Register_Type.ITEM)

			factory_item:set_world_rotation(self.root:GetWorldRotation())
			factory_item:move_to(Vector3.New(pos.x, pos.y, self.item_start_position.z), self.drop_speed)

			if(self.scale_item) then
				factory_item:scale_to(Vector3.New(the_scale.x, the_scale.x, the_scale.x), self.drop_speed)
			end
			
			Factory.Events.trigger(Factory_Events.FABRICATOR_ITEM_CREATED, factory_item, self)

			if(factory_item ~= nil and factory_item:is_valid()) then
				Task.Spawn(function()
					self.machine:register_item(factory_item)
				end, self.drop_speed)
			end
		end
	end, self.spawned == 0 and self.spawn_interval or 0)

	t.repeatCount = math.max(-1, self.max_items - 1)
	t.repeatInterval = self.spawn_interval
end

return Fabricator