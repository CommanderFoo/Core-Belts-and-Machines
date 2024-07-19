---@type StaticMesh
local GEAR_1 = script:GetCustomProperty("Gear1"):WaitForObject()

---@type StaticMesh
local GEAR_2 = script:GetCustomProperty("Gear2"):WaitForObject()

local SPEED = script:GetCustomProperty("Speed")

local rotation_speed = Rotation.New(0, SPEED, 0)

GEAR_1:RotateContinuous(-rotation_speed, 10, true)
GEAR_2:RotateContinuous(rotation_speed, 10, true)