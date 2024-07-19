---@type Tween
local Tween = require(script:GetCustomProperty("Tween"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type Factory_Events
local Factory_Events = require(script:GetCustomProperty("Factory_Events"))

local SPAWN_INTERVAL = ROOT:GetCustomProperty("SpawnInterval")

local PLASMA_BALL = script:GetCustomProperty("PlasmaBall"):WaitForObject()

local tween = nil

local function grow()
	tween = Tween:new(2, { s = .5 }, { s = 8 })

	tween:on_change(function(c)
		PLASMA_BALL:SetScale(Vector3.New(c.s))	
	end)

	tween:on_complete(function()
		tween = nil
	end)
end

function Tick(dt)
	if(tween ~= nil) then
		tween:tween(dt)
	end
end

local t = Task.Spawn(grow)

t.repeatCount = -1
t.repeatInterval = SPAWN_INTERVAL