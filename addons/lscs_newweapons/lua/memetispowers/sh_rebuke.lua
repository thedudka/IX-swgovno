hook.Add("EntityTakeDamage", "lscs_rebuke_hook", function(ply, dmginfo)
	if not IsValid(ply) or not ply:IsPlayer() then return end
	if ply:GetNWFloat("lscs_rebuke", 0) < CurTime() then return end

	local damage = dmginfo:GetDamage()
	local attacker = dmginfo:GetAttacker()
	local blockpercent = 0.5

	dmginfo:ScaleDamage(1 - blockpercent)
	if not IsValid(attacker) or dmginfo:IsFallDamage() then return end
	attacker:TakeDamage(damage * blockpercent, ply, ply)
end)