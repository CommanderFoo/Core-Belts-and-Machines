---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Crafter
local Crafter = require(script:GetCustomProperty("Crafter"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type Factory_Machine
local crafter = Crafter:new(script, ROOT)

Factory.register(crafter, Factory.Register_Type.MACHINE)