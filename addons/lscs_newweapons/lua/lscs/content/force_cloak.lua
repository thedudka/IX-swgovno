local force = {}
force.PrintName = "Cloak"
force.Author = "Blu-x92 / Luna"
force.Description = "Hide yourself from all but the most perceptive."
force.id = "cloak"
force.OnClk =  function( ply, TIME )

	local _HeldSwep = ply:GetActiveWeapon()

	if not ply:GetNWBool( "_lscsForceCloak", false ) then return end 
	-- Anywhere you see a ply:SetNWBool or ply:GetNWBool is either setting or checking a true or false to see if the cloak is active
	if not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE then -- If the player is dead or in an observer mode, they shouldn't be cloaked
		ply:SetNWBool( "_lscsForceCloak", false )
		return
	end

	ply:lscsTakeForce() -- Keeps force from regenerating while cloak is active
 
	if (ply._lscsCloakTime or 0) < TIME then -- If the cloak runs out...
		ply:SetNWBool( "_lscsForceCloak", false ) -- Turn off cloak
		ply:SetRenderMode( 0 ) -- Make the player and weapon  opaque
		_HeldSwep:SetRenderMode( 0 )
		ply:SetColor( Color(255, 255, 255, 255) ) -- Reset player and weapon color
		_HeldSwep:SetColor( Color(255, 255, 255, 255) )
		ply._lscsNextForce = CurTime() + 15 -- Starts a 15 second cooldown
		ply:SetNoTarget( false ) -- Makes the player targetable by NPCS
		hook.Add( "PlayerSwitchWeapon", "WeaponSwitchCloak", function( ply, oldWeapon, newWeapon )
			newWeapon:SetRenderMode( 0 )
			newWeapon:SetColor( Color(255, 255, 255, 255) )
		end)
	end
end
force.UnEquip = function( ply ) ply:SetNWBool( "_lscsForceCloak", false ) end -- Turns off cloak if the power is unequipped
force.StartUse = function( ply )
	local Time = CurTime()
	
	local _HeldSwep = ply:GetActiveWeapon()

	local CanDo = (ply._lscsNextForce or 0) < Time

	if not CanDo then return end -- Stops people from spamming the ability

	ply._lscsNextForce = Time + 1 -- Use the integer here to edit the base cooldown
	
	if ply:GetNWBool( "_lscsForceCloak", false ) then
		ply:SetNWBool( "_lscsForceCloak", false )
		ply._lscsNextForce = Time + 15 -- If the player turns off the cloak manually, have a 15 second cooldown before they can turn it back on
	else
		if ply:lscsGetForce() >= 30 then -- cannot turn on cloak if you have less than 30 force
			ply:SetNWBool( "_lscsForceCloak", true )
			ply._lscsCloakTime = CurTime() + 15 -- Cloak will only stay on for 15 seconds, change the integer if you want it longer or shorter

			ply:lscsTakeForce( 30 ) -- Change integer to set force cost
			ply:EmitSound("lscs/force/pull.mp3")
		end
	end
	if ply:GetNWBool( "_lscsForceCloak", true ) == true then -- Makes the player and weapon able to be translucent and then sets their color
		ply:SetRenderMode( 1 )
		_HeldSwep:SetRenderMode( 1 )
		ply:SetColor( Color(0, 0, 0, 20) )
		_HeldSwep:SetColor( Color(0, 0, 0, 20) )
		ply:SetNoTarget( true ) -- Makes NPCS ignore the player (This is so easy, why do so few cloaks actually do it? e_e)
		hook.Add( "PlayerSwitchWeapon", "WeaponSwitchCloak", function( ply, oldWeapon, newWeapon )
			newWeapon:SetRenderMode( 1 )
			newWeapon:SetColor( Color(0, 0, 0, 20) )
		end)
	end
	if ply:GetNWBool( "_lscsForceCloak", false ) == false then -- Makes the player and weapon opaque if the player manually turns off the cloak
		ply:SetRenderMode( 0 )
		_HeldSwep:SetRenderMode( 0 )
		ply:SetColor( Color(255, 255, 255, 255) )
		_HeldSwep:SetColor( Color(255, 255, 255, 255) )
		ply:SetNoTarget( false )
		hook.Add( "PlayerSwitchWeapon", "WeaponSwitchCloak", function( ply, oldWeapon, newWeapon )
			newWeapon:SetRenderMode( 0 )
			newWeapon:SetColor( Color(255, 255, 255, 255) )
		end)
	end
end
LSCS:RegisterForce( force )


	