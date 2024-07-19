---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Belt
local Belt = require(script:GetCustomProperty("Belt"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type Factory_Machine
local belt = Belt:new(script, ROOT)

Factory.register(belt, Factory.Register_Type.MACHINE)