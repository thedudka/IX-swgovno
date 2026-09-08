local force = {}
force.PrintName = "Dismantle"
force.Author = "Solace"
force.Description = "Know your place, you fool."
force.id = "clascleave" -- lowercase only

force.OnClk =  function( ply, TIME )
	if ply._holdingcleave then	
		ply._CleaveTimer = (math.Clamp( (CurTime() - ply._CleaveStart ), 0, 10 ) )
		
		if ply._CleaveTimer < 10 then
			ply:lscsTakeForce( 1 )
		end
	end
end

force.StartUse = function( ply )
	if ply:lscsGetForce() < 50 then return end -- do we have enough force points ?
	
	local Time = CurTime()
	
	ply._holdingcleave = false
	
	local CanCleave = (ply._lscsNextForce or 0) < Time
	
	if not CanCleave then return end
	
	ply._holdingcleave = true
	ply._CleaveStart = CurTime()
end
force.StopUse = function( ply )
	if ply._holdingcleave then
		local AimVector = ply:GetAimVector()
		local MyPos = ply:GetShootPos()
		ply.EffectPos = nil
		
		local CleaveDamage = math.Clamp( (100 * ply._CleaveTimer), 100, 1000 )
		
		for _, Ent in pairs( ents.FindInSphere( MyPos, 800 ) ) do
			local Sub = (Ent.GetShootPos and Ent:GetShootPos() or Ent:GetPos()) - MyPos
			local ToTarget = Sub:GetNormalized()

			if math.deg( math.acos( math.Clamp( AimVector:Dot( ToTarget ) ,-1,1) ) ) < 30 then
				local Dist = Sub:Length()

				if IsValid( Ent ) and Dist < 400 then
					if Ent:IsNPC() or Ent:IsPlayer() then
						local BoneID = Ent:LookupBone("ValveBiped.Bip01_Spine")
						if BoneID then
							ply.EffectPos = Ent:GetBonePosition(BoneID)
						end
						
						for i = 0, 20 do
							timer.Simple( 0.025 * i, function ()
								ply:EmitSound("weapons/knife/knife_deploy1.wav")
							end)
						end
					
						timer.Simple( 0.5, function()
							if Ent:IsValid() then
								if BoneID then
									ply.EffectPos = Ent:GetBonePosition(BoneID)
								end
								local effectdata = EffectData()
								effectdata:SetOrigin( ply.EffectPos or Ent:GetPos() - (AimVector * 20) )
								effectdata:SetEntity( Ent )
								effectdata:SetScale(2)
								effectdata:SetMagnitude(18)
								util.Effect( "force_cleave", effectdata, true, true )
								
								for i = 0, 20 do
									local effectdata2 = EffectData()
									effectdata2:SetOrigin( (ply.EffectPos or Ent:GetPos()) + ( VectorRand() * math.Rand( 50, 80 )) )
									effectdata2:SetEntity( Ent )
									effectdata2:SetScale(2)
									effectdata2:SetMagnitude(18)
									util.Effect( "force_cleave_sparkle", effectdata2, true, true )
								end
								
								
								Ent:TakeDamage(CleaveDamage , ply, ply)
								Ent:EmitSound("weapons/knife/knife_hit1.wav")
							return end
						end)
					end
				end
			end
		end	
		
		ply._lscsNextForce = CurTime() + 3
		LSCS:PlayVCDSequence( ply, "gesture_item_give", 0.5 )
		ply._holdingcleave = false
	end
end
LSCS:RegisterForce( force )