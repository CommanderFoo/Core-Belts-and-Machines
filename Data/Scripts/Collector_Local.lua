---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Collector
local Collector = require(script:GetCustomProperty("Collector"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

local collector = Collector:new(script, ROOT)

Factory.register(collector, Factory.Register_Type.MACHINE)