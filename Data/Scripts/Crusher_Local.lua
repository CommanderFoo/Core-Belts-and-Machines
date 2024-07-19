---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Crusher
local Crusher = require(script:GetCustomProperty("Crusher"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

local crusher = Crusher:new(script, ROOT)

Factory.register(crusher, Factory.Register_Type.MACHINE)