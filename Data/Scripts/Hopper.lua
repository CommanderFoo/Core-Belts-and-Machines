---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---@class Hopper
local Hopper = Class("Hopper", Factory_Machine)

function Hopper:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)

	---The machine type for this class.
	---@type string
	self.type = Factory.Machine_Type.HOPPER

	self:init()

	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Hopper:init()
	self.collision = self.script:GetCustomProperty("Collision"):WaitForObject()
	self.item_align_point = self.script:GetCustomProperty("ItemAlignPoint"):WaitForObject()
	self.item_align_point_pos = self.item_align_point:GetWorldPosition()
	self.item_end_point = self.script:GetCustomProperty("ItemEndPoint"):WaitForObject()
	self.item_end_point_pos = self.item_end_point:GetWorldPosition()
	self.speed = self.root:GetCustomProperty("Speed")
	
	self:get_connected()
	
end

function Hopper:register_item(factory_item)
	self:move_item(factory_item)
end

---The item to register with the Factory.
---@return StaticMesh
function Hopper:get_registery_item()
	return self.collision
end

return Hopper