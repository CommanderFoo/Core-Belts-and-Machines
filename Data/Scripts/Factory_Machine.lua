---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

local FACTORY_ITEMS = require(script:GetCustomProperty("FactoryItems"))

local FACTORY_RECIPES = require(script:GetCustomProperty("FactoryRecipes"))

---The base class for all factory machines.
---@class Factory_Machine
local Factory_Machine = Class("Factory_Machine")

---Magic number for belt speed (VFX) and tween speed.
---@type number
Factory_Machine.static.MAGIC_NUM = 1.20

---Distance of the raycast to find other connections.
---@type number
Factory_Machine.static.raycast_distance = 130

---Amount of items that are allowed to be stuck before they are destroyed.
---@type number
Factory_Machine.static.stuck_items = 5

---Used for debug raycasts for all machines.
---@type table
Factory_Machine.static.raycast_debug = {

	shouldDebugRender = false,
	debugRenderDuration = 250,
	debugRenderThickness = 1.8

}

Factory_Machine.static.factory_items = FACTORY_ITEMS
Factory_Machine.static.factory_recipes = FACTORY_RECIPES

function Factory_Machine:initialize()
	self:set_unique_id(Factory.get_next_unique_id())

	---This is the machine type that can be used to see what type the machine is.
	---@type string
	self.type = Factory.Machine_Type.BASE

	---@type string
	self.base_type = Factory.Machine_Type.BASE

	---The root of the object. Custom properties on the root are what is exposed
	---to the creator.
	---@type CoreObject
	self.root = nil

	---The script for this item that creates the instance.
	---@type Script|CoreObject
	self.script = nil

	---The collider for this machine. This is an important peice that will aid in other machines
	---being able to connect to this.
	---@type StaticMesh
	self.collider = nil

	---The belt collider position.
	---@type Vector3
	self.collider_pos = Vector3.ZERO

	---The item end point object.
	---@type SmartObject
	self.item_end_point = nil

	---The item end point position.
	---@type Vector3
	self.item_end_point_pos = Vector3.ZERO

	---The rotation speed of the item.
	---@type number
	self.rotation_speed = .5

	---The delay of the rotation.
	---@type number
	self.rotation_delay = .3

	---The item align point acts like a start point for a machine. It can be moved manually inside the
	---collider so a previous connection can send the item to this belt correctly.
	---@type SmartObject
	self.item_align_point = nil

	---The align point position.
	---@type Vector3
	self.item_align_point_pos = Vector3.ZERO

	self.speed = 1

	self.connections = {}

	self.items = {}

	self.can_raycast_forward = true
	self.can_raycast_back = true
	self.can_raycast_left = true
	self.can_raycast_right = true
	self.can_raycast_up = true
	self.can_raycast_down = true

	self.unique_id = 0

	self.belts = {}

	self.items = {}

	self.stuck_items = {}

	self.connected_machines = {}

	Factory.Events.trigger(Factory_Events.MACHINE_PRE_INIT, self)
end

function Factory_Machine:get_forward(start_pos)
	if(not self.can_raycast_forward or not Object.IsValid(self.item_end_point)) then
		return
	end

	local forward = (self.item_end_point:GetWorldRotation() * Vector3.FORWARD)
	local forward_end_pos = start_pos + (forward * Factory_Machine.raycast_distance)

	local forward_hit = World.Raycast(start_pos, forward_end_pos, Factory_Machine.raycast_debug)

	if(forward_hit ~= nil) then
		Factory.fetch_machine(forward_hit.other, function(machine)
			if(machine ~= nil and machine:get_base_type() == Factory.Machine_Type.BASE) then
				self.connections.forward = machine
				self.connections.any = machine
				
				machine:add_connected_machine(self)
			end
		end)
	end
end

function Factory_Machine:get_back(start_pos)
	if(not self.can_raycast_back or not Object.IsValid(self.item_end_point)) then
		return
	end

	local back = (self.item_end_point:GetWorldRotation() * -Vector3.FORWARD)
	local back_end_pos = start_pos + (back * Factory_Machine.raycast_distance)
	local back_hit = World.Raycast(start_pos, back_end_pos, Factory_Machine.raycast_debug)

	if(back_hit ~= nil) then
		Factory.fetch_machine(back_hit.other, function(machine)
			if(machine ~= nil and machine:get_base_type() == Factory.Machine_Type.BASE) then
				self.connections.back = machine

				if(not self.connections.any) then
					self.connections.any = machine
				end

				machine:add_connected_machine(self)
			end
		end)
	end
end

function Factory_Machine:get_right(start_pos)
	if(not self.can_raycast_right or not Object.IsValid(self.item_end_point)) then
		return
	end

	local right = (self.item_end_point:GetWorldRotation() * Vector3.RIGHT)
	local right_end_pos = start_pos + (right * Factory_Machine.raycast_distance)
	local right_hit = World.Raycast(start_pos, right_end_pos, Factory_Machine.raycast_debug)
	
	if(right_hit ~= nil) then
		Factory.fetch_machine(right_hit.other, function(machine)
			if(machine ~= nil and machine:get_base_type() == Factory.Machine_Type.BASE) then
				self.connections.right = machine

				if(not self.connections.any) then
					self.connections.any = machine
				end

				machine:add_connected_machine(self)
			end
		end)
	end
end

function Factory_Machine:get_left(start_pos)
	if(not self.can_raycast_left or not Object.IsValid(self.item_end_point)) then
		return
	end

	local left = (self.item_end_point:GetWorldRotation() * -Vector3.RIGHT)
	local left_end_pos = start_pos + (left * Factory_Machine.raycast_distance)
	local left_hit = World.Raycast(start_pos, left_end_pos, Factory_Machine.raycast_debug)

	if(left_hit ~= nil) then
		Factory.fetch_machine(left_hit.other, function(machine)
			if(machine ~= nil and machine:get_base_type() == Factory.Machine_Type.BASE) then
				self.connections.left = machine

				if(not self.connections.any) then
					self.connections.any = machine
				end

				machine:add_connected_machine(self)
			end
		end)
	end
end

function Factory_Machine:get_up(start_pos)
	if(not self.can_raycast_up or not Object.IsValid(self.item_end_point)) then
		return
	end

	local up = (self.item_end_point:GetWorldRotation() * Vector3.UP)
	local up_end_pos = start_pos + (up * Factory_Machine.raycast_distance)
	local up_hit = World.Raycast(start_pos, up_end_pos, Factory_Machine.raycast_debug)
	
	if(up_hit ~= nil) then
		Factory.fetch_machine(up_hit.other, function(machine)
			if(machine ~= nil and machine:get_base_type() == Factory.Machine_Type.BASE) then
				self.connections.up = machine

				if(not self.connections.any) then
					self.connections.any = machine
				end

				machine:add_connected_machine(self)
			end
		end)
	end
end

function Factory_Machine:get_down(start_pos)
	if(not self.can_raycast_down or not Object.IsValid(self.item_end_point)) then
		return
	end

	local down = (self.item_end_point:GetWorldRotation() * -Vector3.UP)
	local down_end_pos = start_pos + (down * Factory_Machine.raycast_distance)
	local down_hit = World.Raycast(start_pos, down_end_pos, Factory_Machine.raycast_debug)

	if(down_hit ~= nil) then
		Factory.fetch_machine(down_hit.other, function(machine)
			if(machine ~= nil and machine:get_base_type() == Factory.Machine_Type.BASE) then
				self.connections.down = machine

				if(not self.connections.any) then
					self.connections.any = machine
				end

				machine:add_connected_machine(self)
			end
		end)
	end
end

function Factory_Machine:get_connected()
	local start_pos = Vector3.New(self.item_end_point_pos.x, self.item_end_point_pos.y, self.collider_pos.z)

	self:get_forward(start_pos)
	self:get_back(start_pos)
	self:get_right(start_pos)
	self:get_left(start_pos)
	self:get_up(start_pos)
	self:get_down(start_pos)
end

---Automatically called when an instance is created. Just sets the root and script properties.
---@param s Script|CoreObject
---@param root CoreObject
function Factory_Machine:setup(s, root)
	self.root = root
	self.script = s
end

---Gets the item end point.
---@return SmartObject
function Factory_Machine:get_item_end_point()
	return self.item_end_point
end

---Returns the machine type. See Machine_Type enums.
---@return string
function Factory_Machine:get_type()
	return self.type
end

---Returns the machine base type. See Machine_Type enums.
---@return string
function Factory_Machine:get_base_type()
	return self.base_type
end

---Returns the root object.
---@return CoreObject
function Factory_Machine:get_root()
	return self.root
end

---Returns the script that created the instance of the machine.
---@return Script|CoreObject
function Factory_Machine:get_script()
	return self.script
end

---Returns the object that was used when the item was registered with the Factory.
---@return CoreObject
function Factory_Machine:get_registery_item()
	return self.root
end

---@param factory_item Factory_Item
function Factory_Machine:rotate_item(factory_item)
	if(factory_item == nil) then
		return
	end

	Task.Spawn(function()
		local item = factory_item:get_root()

		if(not Object.IsValid(item) or not Object.IsValid(self.item_end_point)) then
			factory_item:destroy()

			return
		end

		local up = self.item_end_point:GetWorldTransform():GetUpVector()
		local forward = item:GetWorldTransform():GetForwardVector()

		if(self.rotation_delay > 0) then
			Task.Wait(self.rotation_delay)
		end

		factory_item:rotate_to(Rotation.New((up ^ forward) ^ up, up), self.rotation_speed)
	end)
end

function Factory_Machine:align_item(factory_item)
	if(factory_item == nil) then
		return
	end

	local item = factory_item:get_root()

	if(not Object.IsValid(item) or not Object.IsValid(self.item_align_point)) then
		factory_item:destroy()

		return
	end

	local start_pos = item:GetWorldPosition()
 	local distance = (start_pos - self.item_align_point_pos)
	local duration = (distance.size / 100) / (Factory_Machine.MAGIC_NUM * self.speed)

	self:rotate_item(factory_item)

	factory_item:move_to(Vector3.New(start_pos.x - distance.x, self.item_align_point_pos.y, self.item_align_point_pos.z), duration)
	Task.Wait(duration)
end

function Factory_Machine:clear_stuck(direction)
	for index, item in ipairs(self.stuck_items) do
		self.items[item] = nil
		direction:register_item(item, true)
	end

	self.stuck_items = {}
end

function Factory_Machine:move_item(factory_item, callback, direction)
	if(factory_item == nil) then
		return
	end

	Task.Spawn(function()
		if(factory_item == nil) then
			return
		end

		self.items[factory_item] = true

		local item = factory_item:get_root()
		
		self:align_item(factory_item)
		
		if(not Object.IsValid(item) or not Object.IsValid(self.item_end_point)) then
			self.items[factory_item] = nil
			factory_item:destroy()
			
			return
		end

		local start_pos = item:GetWorldPosition()
		local distance = (start_pos - self.item_end_point_pos)
		local duration = (distance.size / 100) / (Factory_Machine.MAGIC_NUM * self.speed)

		factory_item:move_to(Vector3.New(start_pos.x - distance.x, self.item_end_point_pos.y, self.item_end_point_pos.z), duration)

		if(callback ~= nil) then
			callback(duration)
		end

		Task.Wait(duration)

		if(direction ~= nil) then
			self.items[factory_item] = nil
			direction:register_item(factory_item)
			self:clear_stuck(direction)
		elseif(self.connections.any ~= nil) then
			self.items[factory_item] = nil
			self.connections.any:register_item(factory_item)
			self:clear_stuck(self.connections.any)
		else
			self:get_connected()

			if(#self.stuck_items < Factory_Machine.stuck_items) then
				self.stuck_items[#self.stuck_items + 1] = factory_item
			else
				self.items[factory_item] = nil
				factory_item:destroy()
			end
		end
	end)
end

function Factory_Machine:get_item(item)
	for index, row in ipairs(Factory_Machine.factory_items) do
		if(item == row.Item) then
			return row
		end
	end

	return nil
end

function Factory_Machine:get_recipe(recipe_key)
	return Factory_Machine.factory_recipes[recipe_key]
end

function Factory_Machine:register_item(factory_item)
	
end

function Factory_Machine:set_unique_id(id)
	self.unique_id = id
end

function Factory_Machine:get_unique_id()
	return self.unique_id
end

function Factory_Machine:unregister()
	Factory.unregister(self, Factory.Register_Type.MACHINE)
end

function Factory_Machine:destroy_items()
	for item, _ in pairs(self.items) do
		item:destroy()
	end
end

function Factory_Machine:destroy()
	self:destroy_items()
	self:unregister_belts()
	self:unregister()

	if(Object.IsValid(self.root)) then
		Factory.Events.trigger(Factory_Events.MACHINE_DESTROYED, self, self.root.id)
		
		if(Object.IsValid(self.root)) then
			self.root:Destroy()
		end
	end
end

function Factory_Machine:is_valid()
	return Object.IsValid(self.root)
end

function Factory_Machine:register_belt(belt)
	self.belts[#self.belts + 1] = belt
end

function Factory_Machine:unregister_belts()
	for index, belt in ipairs(self.belts) do
		if(Factory.machines[belt] ~= nil) then
			Factory.machines[belt]:destroy_items()
			Factory.machines[belt]:destroy()
		end
	end

	self.belts = {}
end

function Factory_Machine:clear_old_connected_machines()
	for m, machine in pairs(self.connected_machines) do
		if(machine ~= nil and not Object.IsValid(machine:get_root())) then
			self.connected_machines[machine] = nil
		end
	end
end

function Factory_Machine:add_connected_machine(machine)
	self:clear_old_connected_machines()
	self.connected_machines[machine] = machine
end

function Factory_Machine:get_connected_machines()
	return self.connected_machines
end

function Factory_Machine:clear_connection(m)
	local directions = {}

	for direction, machine in pairs(self.connections) do
		if(machine == m) then
			self.connections[direction] = nil
			directions[#directions + 1] = direction
		end
	end

	return directions
end

function Factory_Machine:update_connection(direction)
	if(direction == nil) then
		self:get_connected()
		return
	end

	if(direction == "any") then
		self.connections.any = nil
		return
	end

	self["get_" .. direction](self, Vector3.New(self.item_end_point_pos.x, self.item_end_point_pos.y, self.collider_pos.z))
end

return Factory_Machine