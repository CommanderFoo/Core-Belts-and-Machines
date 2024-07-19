---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Hopper
local Hopper = require(script:GetCustomProperty("Hopper"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

local hopper = Hopper:new(script, ROOT)

Factory.register(hopper, Factory.Register_Type.MACHINE)
