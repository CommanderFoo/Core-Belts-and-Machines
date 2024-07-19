---@type Class, Utils, Array, Tween, Factory_Events
local Class, Utils, Array, Tween, Factory_Events = require(script:GetCustomProperty("Includes"))

---@type Factory
local Factory = require(script:GetCustomProperty("Factory"))

---@type Factory_Machine
local Factory_Machine = require(script:GetCustomProperty("Factory_Machine"))

---@type Factory_Item
local Factory_Item = require(script:GetCustomProperty("Factory_Item"))

---@class Crusher
local Crusher = Class("Crusher", Factory_Machine)

function Crusher:initialize(s, root)
	Factory_Machine.initialize(self)
	Factory_Machine.setup(self, s, root)

	---The machine type for this class.
	---@type string
	self.type = Factory.Machine_Type.CRUSHER

	self:init()
	
	Factory.Events.trigger(Factory_Events.MACHINE_POST_INIT, self)
end

---Sets up the properties in the class by pulling properties from the root and script.
function Crusher:init()
	self.collider = self.script:GetCustomProperty("Collider"):WaitForObject()
	self.collider_pos = self.collider:GetWorldPosition()
	self.item_align_point = self.script:GetCustomProperty("ItemAlignPoint"):WaitForObject()
	self.item_align_point_pos = self.item_align_point:GetWorldPosition()
	self.item_end_point = self.script:GetCustomProperty("ItemEndPoint"):WaitForObject()
	self.item_end_point_pos = self.item_end_point:GetWorldPosition()
	self.speed = self.root:GetCustomProperty("Speed")
	self.default_Item = self.root:GetCustomProperty("DefaultItem")
	self.primary_point = self.script:GetCustomProperty("PrimaryPoint"):WaitForObject()
	self.secondary_point = self.script:GetCustomProperty("SecondaryPoint"):WaitForObject()
	self.primary_point_pos = self.primary_point:GetWorldPosition()
	self.primary_point_rot = self.primary_point:GetWorldRotation()
	self.secondary_point_pos = self.secondary_point:GetWorldPosition()
	self.secondary_point_rot = self.secondary_point:GetWorldRotation()

	self:get_primary_machine()
	self:get_secondary_machine()
end

---The item to register with the Factory.
---@return StaticMesh
function Crusher:get_registery_item()
	return self.collider
end

function Crusher:get_primary_machine()
	local down = (self.primary_point:GetWorldRotation() * -Vector3.UP)
	local down_end_pos = self.primary_point_pos + (down * (Factory_Machine.raycast_distance + 100))
	local down_hit = World.Raycast(self.primary_point_pos, down_end_pos, Factory_Machine.raycast_debug)

	if(down_hit ~= nil) then
		Factory.fetch_machine(down_hit.other, function(machine)
			if(machine ~= nil and machine:get_type() == Factory.Machine_Type.BELT) then
				self.primary_machine = machine
			end
		end)
	end
end

function Crusher:get_secondary_machine()
	local down = (self.secondary_point:GetWorldRotation() * -Vector3.UP)
	local down_end_pos = self.secondary_point_pos + (down * (Factory_Machine.raycast_distance + 100))
	local down_hit = World.Raycast(self.secondary_point_pos, down_end_pos, Factory_Machine.raycast_debug)
	self.secondary_point_hit = down_hit

	if(down_hit ~= nil) then
		Factory.fetch_machine(down_hit.other, function(machine)
			if(machine ~= nil and machine:get_type() == Factory.Machine_Type.BELT) then
				self.secondary_machine = machine
			end
		end)
	end
end

-- Check item is crushable by looking in the table of factory items - DONE
-- table should have 2 columns, primary and secondary - DONE
-- if no primary, crush into the default dust (add to crusher root) - DONE
-- If primary, check if secondary, if no secondary just crush into primary - DONE
-- if primary and secondary, crush into primary and chance of secondary - DONE
-- primary has chance to drop multiple

-- function Crusher:spawn_new_item(factory_item, duration)
-- 	if(factory_item == nil) then
-- 		return
-- 	end

-- 	Task.Spawn(function()
-- 		local item = factory_item:get_root()

-- 		if(Object.IsValid(item)) then
-- 			local new_item = World.SpawnAsset(self.item, {

-- 				position = item:GetWorldPosition(),
-- 				rotation = item:GetWorldRotation(),
-- 				networkContext = NetworkContextType.NETWORKED

-- 			})

-- 			factory_item:destroy()
			
-- 			---@type Factory_Item
-- 			local factory_item = Factory_Item:new(new_item, self.item)

-- 			Factory.register(factory_item, Factory.Register_Type.ITEM)

-- 			if(self.connections.any ~= nil) then
-- 				self.connections.any:register_item(factory_item)
-- 			end
-- 		end
-- 	end, duration)
--end

function Crusher:crush(factory_item)
		local row = factory_item.row
		if row.CrushablePrimary then
			local new_item = World.SpawnAsset(row.CrushablePrimary, {

				position = self.primary_point_pos,
				rotation = self.primary_point_rot,
				networkContext = NetworkContextType.LOCAL_CONTEXT

			})
			factory_item:destroy()
			local new_factory_item = Factory_Item:new(new_item, row.CrushablePrimary)

 			Factory.register(new_factory_item, Factory.Register_Type.ITEM)
			new_factory_item:move_to(self.primary_machine.item_align_point_pos, self.speed)
			self.primary_machine:register_item(new_factory_item)
			--Chance of a secondary
			if (row.CrushableSecondary) and (math.random(2) == 1) then
				local new_item = World.SpawnAsset(row.CrushableSecondary, {
	
					position = self.secondary_point_pos,
					rotation = self.secondary_point_rot,
					networkContext = NetworkContextType.LOCAL_CONTEXT
	
				})
				factory_item:destroy()
				local new_factory_item = Factory_Item:new(new_item, row.CrushableSecondary)
	
				 Factory.register(new_factory_item, Factory.Register_Type.ITEM)
				new_factory_item:move_to(self.secondary_machine.item_align_point_pos, self.speed)
				self.secondary_machine:register_item(new_factory_item)
			end
		else
			-- No primary output so creat single default item
			local new_item = World.SpawnAsset(self.default_Item, {
	
				position = self.secondary_point_pos,
				rotation = self.secondary_point_rot,
				networkContext = NetworkContextType.LOCAL_CONTEXT

			})
			factory_item:destroy()
			local new_factory_item = Factory_Item:new(new_item, self.default_Item)

			 Factory.register(new_factory_item, Factory.Register_Type.ITEM)
			new_factory_item:move_to(self.secondary_machine.item_align_point_pos, self.speed)
			self.secondary_machine:register_item(new_factory_item)
		end

	
end

function Crusher:register_item(factory_item)
	
	self:move_item(factory_item, function(duration)
		self:crush(factory_item)
	end)
end

return Crusher