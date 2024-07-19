local FACTORY_UPGRADES = require(script:GetCustomProperty("FactoryUpgrades"))

---@class Upgrades
local Upgrades = {}

function Upgrades.get_by_root_id(id)
	for index, row in ipairs(FACTORY_UPGRADES) do
		if(Object.IsValid(row.Preview:GetObject()) and string.find(tostring(id), row.Preview.id)) then
			return index, row
		end
	end
end

function Upgrades.get_by_index_id(id)
	for index, row in ipairs(FACTORY_UPGRADES) do
		if(index == id) then
			return row
		end
	end
end

function Upgrades.get_by_index(index)
	return FACTORY_UPGRADES[index]
end

return Upgrades