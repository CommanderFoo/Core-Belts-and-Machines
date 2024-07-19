---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---The Belt class will take care of any items registered with it and move them to where
---they need to be. When the item reaches the destination, it will then register with the
---connected machine. This could be another belt, or another machine that will process the item.
---@class Belt
local Belt = Class("Belt", Factory_Machine)

function Belt:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)

	---The machine type for this class.
	---@type string
	self.type = Factory.Machine_Type.BELT

	---The speed of the belt. Each belt can have their own speed.
	---@type number
	self.speed = 1

	self:init()

	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Belt:init()
	self.collider = self.script:GetCustomProperty("Collider"):WaitForObject()
	self.collider_pos = self.collider:GetWorldPosition()
	self.item_align_point = self.script:GetCustomProperty("ItemAlignPoint"):WaitForObject()
	self.item_align_point_pos = self.item_align_point:GetWorldPosition()
	self.item_end_point = self.script:GetCustomProperty("ItemEndPoint"):WaitForObject()
	self.item_end_point_pos = self.item_end_point:GetWorldPosition()
	self.speed = self.root:GetCustomProperty("BeltSpeed")
	self.rotation_speed = self.root:GetCustomProperty("RotationSpeed")
	self.rotation_delay = self.root:GetCustomProperty("RotationDelay")

	self.can_raycast_up = false
	self.can_raycast_down = false

	self:get_connected()
end

---The item to register with the Factory.
---@return StaticMesh
function Belt:get_registery_item()
	return self.collider
end

function Belt:register_item(factory_item)
	self:move_item(factory_item)
end

return Belt