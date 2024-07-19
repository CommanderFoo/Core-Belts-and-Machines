---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type Factory_Events
local Factory_Events = require(script:GetCustomProperty("Factory_Events"))

---@type SmartObject
local BELT = script:GetCustomProperty("Belt"):WaitForObject()

local BELT_SPEED = ROOT:GetCustomProperty("BeltSpeed")

BELT:SetSmartProperty("Manual Tread Speed", BELT_SPEED)