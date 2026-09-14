local PLUGIN = PLUGIN

PLUGIN.name = "Anti Bunnyhop"
PLUGIN.author = "anonymous"
PLUGIN.description = ""

ix.config.Add("jumpStamina", 15, "Сколько выносливости нужно для прыжка.", nil, {
	data = {min = 0, max = 100},
	category = "characters"
})

function PLUGIN:PlayerBindPress(ply, bind, pressed)
	if string.find(bind, "+walk") then 
		if !IsValid(ply:GetVehicle()) then
			return true 
		end
	end
end

local staminaUse = ix.config.Get("jumpStamina")

function PLUGIN:SetupMove(ply, mv, cmd)
	local char = ply:GetCharacter()
	if mv:KeyPressed(IN_JUMP) then
		local value = ply:GetLocalVar("stm", 0) - staminaUse

		
		if ply:OnGround() then
			if SERVER then
				if !char:IsTrueForceUser() then
				ply:ConsumeStamina(staminaUse)
                end
				if ply:GetVelocity() != (ply.lastVelocity or vector_origin) then
					local ct = CurTime()

					if value > 0 and (!ply.nextJumpTick or ct > ply.nextJumpTick) then
						ply:GetCharacter():DoAction("jump")

						ply.nextJumpTick = ct + 0.24
						ply.lastVelocity = ply:GetVelocity()
					end
				end
			end
		end


		if value <= 0 then
			local buttons = bit.band(mv:GetButtons(), bit.bnot(IN_JUMP))
			mv:SetButtons(buttons)
		end
	end
end