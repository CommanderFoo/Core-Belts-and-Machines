---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---@type Factory_Item
local Factory_Item = require(script:GetCustomProperty("Factory_Item"))

---@class Furnace
local Furnace = Class("Furnace", Factory_Machine)

function Furnace:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)

	---The machine type for this class.
	---@type string
	self.type = Factory.Machine_Type.FURNACE

	self:init()
	
	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Furnace:init()
	self.collider = self.script:GetCustomProperty("Collider"):WaitForObject()
	self.collider_pos = self.collider:GetWorldPosition()
	self.item_align_point = self.script:GetCustomProperty("ItemAlignPoint"):WaitForObject()
	self.item_align_point_pos = self.item_align_point:GetWorldPosition()
	self.item_end_point = self.script:GetCustomProperty("ItemEndPoint"):WaitForObject()
	self.item_end_point_pos = self.item_end_point:GetWorldPosition()
	self.rotation_speed = self.root:GetCustomProperty("RotationSpeed")
	self.rotation_delay = self.root:GetCustomProperty("RotationDelay")
	self.speed = self.root:GetCustomProperty("ProcessSpeed")
	self.item = self.root:GetCustomProperty("Item")

	self:get_connected()
end

---The item to register with the Factory.
---@return StaticMesh
function Furnace:get_registery_item()
	return self.collider
end

function Furnace:spawn_new_item(factory_item, duration)
	if(factory_item == nil) then
		return
	end

	Task.Spawn(function()
		local item = factory_item:get_root()

		if(Object.IsValid(item)) then
			local new_item = World.SpawnAsset(self.item, {

				position = item:GetWorldPosition(),
				rotation = item:GetWorldRotation(),
				networkContext = NetworkContextType.LOCAL_CONTEXT

			})

			factory_item:destroy()
			
			---@type Factory_Item
			local factory_item = Factory_Item:new(new_item, self.item)

			Factory.register(factory_item, Factory.Register_Type.ITEM)

			if(self.connections.any ~= nil) then
				self.connections.any:register_item(factory_item)
			end
		end
	end, duration)
end

function Furnace:register_item(factory_item)
	self:move_item(factory_item, function(duration)
		self:spawn_new_item(factory_item, duration)
	end)
end

return Furnace