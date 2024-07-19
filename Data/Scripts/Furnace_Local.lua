---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Furnace
local Furnace = require(script:GetCustomProperty("Furnace"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

local furnace = Furnace:new(script, ROOT)

Factory.register(furnace, Factory.Register_Type.MACHINE)