---@type Factory_Events
local Factory_Events = require(script:GetCustomProperty("Factory_Events"))

---Central point for accessing registered machines and tweens.
---@class Factory
local Factory = {

	---Enum table for the types of machines supported.
	---@type Machine_Type
	Machine_Type = require(script:GetCustomProperty("Machine_Type")),

	---Enum table for the types of items supported.
	---@type Item_Type
	Item_Type = require(script:GetCustomProperty("Item_Type")),

	---@type table
	Register_Type = {

		MACHINE = 1,
		ITEM = 2

	},

	---Registery of all machines in the game.
	---@type table
	machines = {},

	---Registery of all items in the game.
	---@type table
	items = {},

	---How many times to check to see if a machine is ready. See Factory.fetch.
	---@type number
	repeat_count = 250,

	---How long between each check. See Factory.fetch.
	---@type number
	repeat_duration = 0,

	---Central point for all tweens. Each machine will have a sub table in this table.
	---@type table
	tweens = {},

	item_container = nil,

	unique_id = 0

}

Factory.Events = {

	events = {},
	id = 0,

	on = function(evt, fn)
		Factory.Events.id = Factory.Events.id + 1

		Factory.Events.events[tostring(Factory.Events.id)] = {

			event = evt,
			func = fn,
			id = Factory.Events.id

		}

		return Factory.Events.id
	end,


	off = function(event_id)
		local to_remove = {}

		for k, v in pairs(Factory.Events.events) do
			if(v.id ~= nil and event_id == v.id) then
				Factory.Events.events[k] = nil
			end
		end
	end,

	trigger = function(...)
		local args = {...}

		for i, e in pairs(Factory.Events.events) do
			if(e.event == args[1]) then
				e.func(args[2], args[3], args[4], args[5])
			end
		end
	end

}

---Registers a machine to the machine table. Each machine can override the get_register_item
---if it needs to register a different item. For example, the Belt class registers the belt
---collider due to that being the detection for connections between each other.
---@param object any
function Factory.register(object, type)
	if(type == Factory.Register_Type.MACHINE) then
		Factory.machines[object:get_registery_item()] = object
	elseif(type == Factory.Register_Type.ITEM) then
		Factory.items[object:get_registery_item()] = object
	end
end

function Factory.unregister(object, type)
	if(type == Factory.Register_Type.MACHINE) then
		Factory.machines[object:get_registery_item()] = nil
	elseif(type == Factory.Register_Type.ITEM) then
		Factory.items[object:get_registery_item()] = nil
	end
end

---Depending on the spawn order of machines in the Hierarchy, the machine you are attempty
---to fetch may not be available yet in the registery. This function will allow you to
---specify a callback if you do need to wait. In most cases you should specify a callback.
---See the Fabricator class as an example of using this function.
---@param obj Object The object that was registered.
---@param callback function|nil The callback function to call when the item exists.
---@param duration number|nil How long between each check. Overrides Factory.repeat_duration.
---@param repeat_count integer|nil How many times to keep checking. Overrides Factory.repeat_count.
---@return Factory_Machine|nil 
function Factory.fetch_machine(obj, callback, duration, repeat_count)
	if(callback ~= nil) then
		local t = nil

		t = Task.Spawn(function()
			if(Factory.machines[obj] ~= nil) then
				t:Cancel()
				t = nil

				callback(Factory.machines[obj], obj)
			end
		end)

		t.repeatCount = repeat_count or Factory.repeat_count
		t.repeatInterval = duration or Factory.repeat_duration
	elseif(Factory.machines[obj] ~= nil) then
		return Factory.machines[obj]
	end

	return nil
end

function Factory.fetch_item(obj, callback, duration, repeat_count)
	if(callback ~= nil) then
		local t = nil

		t = Task.Spawn(function()
			if(Factory.items[obj] ~= nil) then
				t:Cancel()
				t = nil

				callback(Factory.items[obj], obj)
			end
		end)

		t.repeatCount = repeat_count or Factory.repeat_count
		t.repeatInterval = duration or Factory.repeat_duration
	elseif(Factory.items[obj] ~= nil) then
		return Factory.items[obj]
	end

	return nil
end

function Factory.fetch_machine_by_root(root_obj)
	for obj, machine in pairs(Factory.machines) do
		if(machine:get_root() == root_obj) then
			return machine
		end
	end

	return nil
end

function Factory.print_machines()
	for obj, machine in pairs(Factory.machines) do
		print(machine:get_root().name)
	end
end

function Factory.get_next_unique_id()
	Factory.unique_id = Factory.unique_id + 1

	return Factory.unique_id
end

function Factory.get_machine_by_unique_id(id)
	for obj, machine in pairs(Factory.machines) do
		if(machine:get_unique_id() == tonumber(id)) then
			return machine
		end
	end

	return nil
end

return Factory