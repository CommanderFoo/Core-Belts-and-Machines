---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Upgrades
local Upgrades = require(script:GetCustomProperty("Upgrades"))

---@type Utils
local Utils = require(script:GetCustomProperty("Utils"))

---@class Preview
local Preview = {}

function Preview.set_container(container)
	Preview.container = container
end

function Preview.update_trigger(trigger, resource, amount)
	if(resource == "Parts" and Object.IsValid(trigger)) then
		local index, row = Upgrades.get_by_root_id(trigger.parent.id)

		if(row ~= nil) then
			if(row.Required:GetObject() == nil and row.Required2:GetObject() == nil) then
				trigger.parent.visibility = Visibility.INHERIT

				if(amount >= row.Cost) then
					trigger.interactionLabel = "Purchase " .. row.DisplayName
					trigger.interactionLabel = trigger.interactionLabel .. " for " .. Utils.number_format(row.Cost) .. " Parts."
				else
					trigger.interactionLabel = "Not enough Parts, " .. Utils.number_format(row.Cost) .. " required."
				end

				trigger.isInteractable = true
			end
		end
	end
end

function Preview.spawn_machine(row)
	if(row.Preview ~= nil and Object.IsValid(row.Preview:GetObject())) then
		local machine = Factory.fetch_machine_by_root(row.Removing:GetObject())

		if(machine ~= nil) then
			local machine_root = machine:get_root()

			if(Object.IsValid(machine_root)) then
				local connected_machines = machine:get_connected_machines()
				local directions = {}

				for machine_index, connected_machine in pairs(connected_machines) do
					local direction_tbl = connected_machine:clear_connection(machine)

					for dir_index, dir in ipairs(direction_tbl) do
						directions[dir] = connected_machine
					end
				end

				World.SpawnAsset(row.Template, {
					
					parent = Preview.container,
					position = machine_root:GetPosition(),
					rotation = machine_root:GetRotation(),
					networkContext = NetworkContextType.LOCAL_CONTEXT

				})

				machine:destroy()
				machine = nil

				for direction, machine in pairs(directions) do
					machine:update_connection(direction)
				end
			end
		end

		row.Preview:GetObject():Destroy()
	end
end

function Preview.purchase_item(player, index)
	local row = Upgrades.get_by_index(index)

	if(player:GetResource("Parts") >= row.Cost) then
		player:RemoveResource("Parts", row.Cost)
		Preview.spawn_machine(row)
		Events.BroadcastToAllPlayers("Update.Preview", index)
	end	
end

function Preview.purchase(trigger, other)
	local row_index, row = Upgrades.get_by_root_id(trigger.parent.id)

	if(other == Game.GetLocalPlayer() and row ~= nil and other:GetResource("Parts") >= row.Cost) then
		trigger.isInteractable = false
		Events.BroadcastToServer("Preview.Purchase.Item", row_index)
	end
end

function Preview.update(index)
	if(Environment.IsSinglePlayerPreview()) then
		return
	end

	local row = Upgrades.get_by_index(index)

	Preview.spawn_machine(row)
end

return Preview