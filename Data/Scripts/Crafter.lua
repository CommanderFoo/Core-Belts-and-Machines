---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---@type Factory_Item
local Factory_Item = require(script:GetCustomProperty("Factory_Item"))

---@class Crafter
local Crafter = Class("Crafter", Factory_Machine)

function Crafter:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)

	---The machine type for this class.
	---@type string
	self.type = Factory.Machine_Type.CRAFTER

	---@type string
	self.recipe_key = ""

	---@type table
	self.recipe = nil

	self.buffers = { 0, 0, 0 }

	self:init()

	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Crafter:init()
	self.collider = self.script:GetCustomProperty("Collider"):WaitForObject()
	self.collider_pos = self.collider:GetWorldPosition()
	self.item_align_point = self.script:GetCustomProperty("ItemAlignPoint"):WaitForObject()
	self.item_align_point_pos = self.item_align_point:GetWorldPosition()
	self.item_end_point = self.script:GetCustomProperty("ItemEndPoint"):WaitForObject()
	self.item_end_point_pos = self.item_end_point:GetWorldPosition()
	self.rotation_speed = self.root:GetCustomProperty("RotationSpeed")
	self.rotation_delay = self.root:GetCustomProperty("RotationDelay")
	self.speed = self.root:GetCustomProperty("ProcessSpeed")
	self.recipe_key = self.root:GetCustomProperty("RecipeKey")

	self.recipe = self:get_recipe(self.recipe_key)

	if(self.recipe == nil) then
		return
	end

	self:get_connected()
end

---The item to register with the Factory.
---@return StaticMesh
function Crafter:get_registery_item()
	return self.collider
end

function Crafter:create_output()
	local new_item = World.SpawnAsset(self.recipe.OutputItem, {

		position = self.item_end_point_pos,
		rotation = self.item_end_point:GetWorldRotation(),
		networkContext = NetworkContextType.LOCAL_CONTEXT

	})

	---@type Factory_Item
	local factory_item = Factory_Item:new(new_item, self.recipe.OutputItem)

	Factory.register(factory_item, Factory.Register_Type.ITEM)

	if(self.connections.any ~= nil) then
		self.connections.any:register_item(factory_item)
	end
end

function Crafter:buffers_full()
	local is_full = true

	for i = 1, 3 do
		if(self.recipe["Item" .. tostring(i) .. "Quantity"] ~= self.buffers[i]) then
			is_full = false
			break
		end
	end

	return is_full
end

function Crafter:reset_buffers()
	self.buffers = { 0, 0, 0 }
end

function Crafter:is_in_recipe(factory_item)
	local template = factory_item:get_template()
	local recipe_item = nil
	local recipe_quantity = 0
	local buffer_index = 1

	for i = 1, 3 do
		local key = "Item" .. tostring(i)

		if(self.recipe[key] == template) then
			recipe_item = self.recipe[key]
			recipe_quantity = self.recipe[key .. "Quantity"]
			buffer_index = i

			break
		end
	end

	if(recipe_item ~= nil and recipe_quantity > 0) then
		if(self.buffers[buffer_index] < recipe_quantity) then
			self.buffers[buffer_index] = self.buffers[buffer_index] + 1

			factory_item:destroy()

			if(self:buffers_full()) then
				self:reset_buffers()
				self:create_output()
			end
			
			return true
		end
	end

	return false
end

function Crafter:register_item(factory_item)
	if(not self:is_in_recipe(factory_item)) then
		self:move_item(factory_item)
	end
end

return Crafter