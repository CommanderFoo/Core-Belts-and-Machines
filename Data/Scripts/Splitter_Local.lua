---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Splitter
local Splitter = require(script:GetCustomProperty("Splitter"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type Factory_Machine
local splitter = Splitter:new(script, ROOT)

Factory.register(splitter, Factory.Register_Type.MACHINE)