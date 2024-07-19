---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Events
local Factory_Events = require(script:GetCustomProperty("Factory_Events"))

Factory.Events.on(Factory_Events.FABRICATOR_ITEM_CREATED, function(item, machine)
	
end)