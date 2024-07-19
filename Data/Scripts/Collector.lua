---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---@class Collector
local Collector = Class("Collector", Factory_Machine)

function Collector:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)

	---The machine type for this class.
	---@type string
	self.type = Factory.Machine_Type.COLLECTOR

	---The speed of the item.
	---@type number
	self.speed = 1

	---Position of the item align point.
	---@type Vector3
	self.align_position = Vector3.ZERO

	---Min item scale size. 
	---@type number
	self.min_item_scale = 0

	self.scale_item = false

	self:init()

	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Collector:init()
	self.speed = self.root:GetCustomProperty("Speed")
	self.collision = self.script:GetCustomProperty("Collision"):WaitForObject()
	self.align_point = self.script:GetCustomProperty("ItemAlignPoint"):WaitForObject()
	self.align_point_position = self.align_point:GetWorldPosition()
	self.min_item_scale = self.root:GetCustomProperty("MinItemScale")
	self.scale_item = self.root:GetCustomProperty("ScaleItem")
end

function Collector:register_item(factory_item)
	-- ---@TODO: Get player who owns this item
	-- Game.GetPlayers()[1]:AddResource("Parts", factory_item:get_value())
	factory_item:move_to(self.align_point_position, self.speed)

	local the_scale = Vector3.New(self.min_item_scale)
	
	if(self.scale_item) then
		factory_item:scale_to(the_scale, self.speed)
	end

	Task.Wait(self.speed)
	factory_item:destroy()
end

---The item to register with the Factory.
---@return StaticMesh
function Collector:get_registery_item()
	return self.collision
end

return Collector