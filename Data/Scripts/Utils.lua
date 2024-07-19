---@class Utils
local Utils = {}

Utils.random_float = function(min, max)
	return (math.random() * (max - min) + min)
end

function Utils.number_format(i)
	return tostring(i):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function Utils.wait_for_data(player)
	while(_G.data == nil or _G.data[player] == nil) do
		Task.Wait()
	end
end

---@class Array
local Array = {}

function Array.remove(t, item_to_remove)
	local j, n = 1, #t

	for i = 1, n do
		if(t[i] ~= item_to_remove) then
			if(i ~= j) then
				t[j] = t[i]
				t[i] = nil
			end

			j = j + 1
		else
			t[i] = nil
		end
	end

	return t
end

return Utils, Array