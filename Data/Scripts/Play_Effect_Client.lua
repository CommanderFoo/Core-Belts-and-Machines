
---@type Vfx
local EFFECT = script:GetCustomProperty("Effect"):WaitForObject()

local OBJECT = script:GetCustomProperty("Object"):WaitForObject()

EFFECT:Play()
OBJECT.visibility = Visibility.INHERIT
Task.Wait(.4)
script:Destroy()