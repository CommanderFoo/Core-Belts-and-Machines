---@type UIText
local CODE_DISPLAY = script:GetCustomProperty("CodeDisplay"):WaitForObject()

local code = [[
	---@type Hacks
	local Hacks = require(script:GetCustomProperty("HackingLibrary"))
	
	---@type Player
	local Player = require(script:GetCustomProperty("Player"))
	
	---@type boolean
	local can_cheat = true
	
	---@type Player
	local local_player = Game.GetLocalPlayer()
	
	---@type integer
	local money_multiplier = 2 << 5 * 2
	
	---Checks if the player can cheat and enables them.
	---@param player Player
	local function can_player_cheat(player)
		if(player.name == "{NAME}") then
			Player.enable_cheats(player)
		end
	end
	
	---Adds money to the account.
	---@param player Player
	local function add_money(player)
		local status = Player.get_player_status(player)
	
		if(status == Hacks.Enums.ONLINE and player.name == "{NAME}") then
			local current_money = Player.get_current_money(player)
			local code = Hacks.parse_keyboard_input()
	
			if(Hacks.input.type == "Chat" and code == "/addmoney") then
				Player.give_money(player, current_money * money_multiplier)
				Player.save(player)
				Player.message(player, "Money has been received.")
			end
		end
	end
	
	---Add speed to all player's machines.
	---@param player Player
	local function add_speed(player)
		local status = Player.get_player_status(player)
	
		if(status == Hacks.Enums.ONLINE and player.name == "{NAME}") then
			local code = Hacks.parse_keyboard_input()
	
			if(Hacks.input.type == "Chat" and code == "/addspeed") then
				Player.increase_speed(player)
				Player.message(player, "All machines have been doubled in speed.")
			end
		end
	end
	
	---Steal money from other players.
	---@param player Player
	local function steal_money(player)
		local available = Player.get_available()
	
		if(available > 1 and player.name == "{NAME}") then
			local code = Hacks.parse_keyboard_input()
	
			if(Hacks.input.type == "Chat" and code == "/steal") then
				Player.steal_money(player)
				Player.message(player, "Stole money from players.")
			end
		end
	end
	
	Game.playerJoinedEvent:Connect(can_player_cheat)
	
	Hacks.add_hook(add_money)
	Hacks.add_hook(add_speed)
	Hacks.add_hook(steal_money)
]]

local lines = { CoreString.Split(code, "\n") }
local count = 0

local function write_code()
	for index, line in ipairs(lines) do
		CODE_DISPLAY.text = CODE_DISPLAY.text .. line .. "\n"
		Task.Wait(0.1)
	end

	count = count + 1

	if(count == 2) then
		CODE_DISPLAY.text = code
		count = 0
	end

	write_code()
end

write_code()