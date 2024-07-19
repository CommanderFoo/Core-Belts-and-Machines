---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Fabricator
local Fabricator = require(script:GetCustomProperty("Fabricator"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type Factory_Machine
local fabricator = Fabricator:new(script, ROOT)

Factory.register(fabricator, Factory.Register_Type.MACHINE)

local spawned = false

Game.playerJoinedEvent:Connect(function(player)
	if(spawned) then
		return
	end

	spawned = true
	fabricator:create()
end)