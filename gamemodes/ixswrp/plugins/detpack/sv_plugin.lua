local PLUGIN = PLUGIN

function PLUGIN:PhysgunPickup(client, entity)
	if (entity.ixDetpackAnchored) then
		return false
	end
end

function PLUGIN:GravGunPickupAllowed(client, entity)
	if (entity.ixDetpackAnchored) then
		return false
	end
end
