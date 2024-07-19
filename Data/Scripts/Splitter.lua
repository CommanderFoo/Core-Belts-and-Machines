---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---@class Splitter
local Splitter = Class("Splitter", Factory_Machine)

---@type table
Splitter.static.Direction = {

	NONE = 0,
	LEFT = 1,
	RIGHT = 2

}

function Splitter:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)

	---The machine type for this class.
	---@type string
	self.type = Factory.Machine_Type.SPLITTER

	self.direction = 0
	self.alternate_direction = 0

	self:init()

	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Splitter:init()
	self.collider = self.script:GetCustomProperty("Collider"):WaitForObject()
	self.collider_pos = self.collider:GetWorldPosition()
	self.item_align_point = self.script:GetCustomProperty("ItemAlignPoint"):WaitForObject()
	self.item_align_point_pos = self.item_align_point:GetWorldPosition()
	self.item_end_point = self.item_align_point
	self.item_end_point_pos = self.item_align_point_pos
	self.alternate = self.root:GetCustomProperty("Alternate")
	self.left_item_filter = self.root:GetCustomProperty("LeftItemFilter")
	self.right_item_filter = self.root:GetCustomProperty("RightItemFilter")

	self:get_forward(Vector3.New(self.item_end_point_pos.x, self.item_end_point_pos.y, self.collider_pos.z))
	self:get_back(Vector3.New(self.item_end_point_pos.x, self.item_end_point_pos.y, self.collider_pos.z))
end

---The item to register with the Factory.
---@return StaticMesh
function Splitter:get_registery_item()
	return self.collider
end

function Splitter:register_item(factory_item)
	local filter_count = 0
	local connection = self.connections.any
	local direction = Splitter.Direction.NONE
	local do_random = false
	local do_alternate = false

	if(self.right_item_filter ~= nil) then
		filter_count = filter_count + 1
		
		if(self.right_item_filter == factory_item:get_template()) then
			direction = Splitter.Direction.RIGHT
		end
	end
	
	if(self.left_item_filter ~= nil) then
		filter_count = filter_count + 1

		if(self.left_item_filter == factory_item:get_template()) then
			direction = Splitter.Direction.LEFT
		end
	end

	if(direction > Splitter.Direction.NONE) then
		if(direction == Splitter.Direction.LEFT) then
			connection = self.connections.forward
		else
			connection = self.connections.back
		end
	elseif(filter_count == 1) then
		if(self.right_item_filter ~= nil) then
			connection = self.connections.forward
		else
			connection = self.connections.back
		end		
	elseif(filter_count == 2) then
		if(self.alternate) then
			do_alternate = true
		else
			do_random = true
		end
	else
		do_random = true
	end

	if(do_alternate or self.alternate) then
		do_random = true

		if(self.alternate_direction == 0) then
			connection = self.connections.forward
			self.alternate_direction = 1
		elseif(self.alternate_direction == 1) then
			connection = self.connections.back
			self.alternate_direction = 0
		end
	elseif(do_random) then
		if(math.random(2) == 1) then
			connection = self.connections.forward
		else
			connection = self.connections.back
		end
	end

	self:move_item(factory_item, nil, connection)
end

return Splitter