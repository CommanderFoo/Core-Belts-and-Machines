---@type Class
local Class = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

local FACTORY_ITEMS = require(script:GetCustomProperty("FactoryItems"))

---The base class for all factory items.
---@class Factory_Item
local Factory_Item = Class("Factory_Item")

function Factory_Item:initialize(item, template)

	---The root of the object. Custom properties on the root are what is exposed
	---to the creator.
	---@type CoreObject
	self.root = item

	self.template = template
	self:fetch_item_data()
end

---Automatically called when an instance is created. Just sets the root and script properties.
---@param root CoreObject
function Factory_Item:setup(root)
	self.root = root
end

function Factory_Item:fetch_item_data()
	for index, row in ipairs(FACTORY_ITEMS) do
		if(row.Item == self.template) then
			self.value = row.Value
			self.row = row
			break
		end
	end
end

function Factory_Item:get_template()
	return self.template
end

---Returns the item type. See Item_Type enums.
---@return string
function Factory_Item:get_type()
	return self.type
end

---Returns the item base type. See Item_Type enums.
---@return string
function Factory_Item:get_base_type()
	return self.base_type
end

---Returns the root object.
---@return CoreObject
function Factory_Item:get_root()
	return self.root
end

---Returns the object that was used when the item was registered with the Factory.
---@return Factory_Item
function Factory_Item:get_registery_item()
	return self
end

function Factory_Item:set_world_rotation(rotation)
	if(Object.IsValid(self.root)) then
		self.root:SetWorldRotation(rotation)
	end
end

function Factory_Item:move_to(position, speed)
	if(Object.IsValid(self.root)) then
		self.root:MoveTo(position, speed)
	end
end

function Factory_Item:scale_to(scale, speed)
	if(Object.IsValid(self.root)) then
		self.root:ScaleTo(scale, speed)
	end
end

function Factory_Item:rotate_to(rotation, speed)
	if(Object.IsValid(self.root)) then
		self.root:RotateTo(rotation, speed)
	end
end

function Factory_Item:unregister()
	Factory.unregister(self, Factory.Register_Type.ITEM)
end

function Factory_Item:destroy()
	self:unregister()

	if(Object.IsValid(self.root)) then
		self.root:Destroy()
	end
end

function Factory_Item:is_valid()
	return Object.IsValid(self.root)
end

function Factory_Item:get_value()
	return self.value
end

return Factory_Item