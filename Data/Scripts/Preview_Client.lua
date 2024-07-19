---@type Preview
local Preview = require(script:GetCustomProperty("Preview"))

local Player_Area = script:GetCustomProperty("PlayerArea")

if(Player_Area ~= nil) then
	Player_Area = require(Player_Area)
end

---@type Trigger
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()

local LOCAL_PLAYER = Game.GetLocalPlayer()

LOCAL_PLAYER.resourceChangedEvent:Connect(function(player, resource, amount)
	Preview.update_trigger(TRIGGER, resource, amount)
end)

if(Player_Area ~= nil and not Player_Area.is_owner(LOCAL_PLAYER, script)) then
	TRIGGER.isInteractable = false
else
	TRIGGER.interactedEvent:Connect(Preview.purchase)

	Preview.update_trigger(TRIGGER, "Parts", LOCAL_PLAYER:GetResource("Parts"))
end