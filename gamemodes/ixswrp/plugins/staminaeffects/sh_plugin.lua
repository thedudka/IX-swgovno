local PLUGIN = PLUGIN

PLUGIN.name = "Stamina Effects"
PLUGIN.author = ""
PLUGIN.description = "Adds a stamina-based toy town effect and heartbeat."

if (CLIENT) then
	local heartbeatSound = "player/heartbeat1.wav"
	local heartbeatTimer = "ixStaminaEffectsHeartbeat"
	local heartbeatFadeTimer = "ixStaminaEffectsHeartbeatFade"

	local function StopHeartbeat()
		timer.Remove(heartbeatTimer)
		timer.Remove(heartbeatFadeTimer)

		if (PLUGIN.heartbeatSoundPatch) then
			PLUGIN.heartbeatSoundPatch:Stop()
			PLUGIN.heartbeatSoundPatch = nil
		end
	end

	local function FadeHeartbeat()
		timer.Remove(heartbeatTimer)

		if (!PLUGIN.heartbeatSoundPatch or timer.Exists(heartbeatFadeTimer)) then
			return
		end

		PLUGIN.heartbeatSoundPatch:ChangeVolume(0, 0.75)

		timer.Create(heartbeatFadeTimer, 0.75, 1, function()
			local client = LocalPlayer()

			if (IsValid(client) and client:Alive() and client:GetCharacter() and
				client:GetNetVar("brth", false)) then
				PLUGIN.heartbeatSoundPatch:ChangeVolume(0.35, 0.1)
				return
			end

			StopHeartbeat()
		end)
	end

	function PLUGIN:Think()
		local client = LocalPlayer()
		local exhausted = IsValid(client) and client:Alive() and
			client:GetCharacter() and client:GetNetVar("brth", false)

		if (!exhausted) then
			FadeHeartbeat()
			return
		end

		timer.Remove(heartbeatFadeTimer)

		if (!self.heartbeatSoundPatch) then
			self.heartbeatSoundPatch = CreateSound(client, heartbeatSound)
			self.heartbeatSoundPatch:PlayEx(0.35, 100)
		else
			self.heartbeatSoundPatch:ChangeVolume(0.35, 0.1)
		end

		if (!timer.Exists(heartbeatTimer)) then
			local soundDuration = SoundDuration(heartbeatSound)
			if (soundDuration <= 0) then
				soundDuration = 1
			end

			timer.Create(heartbeatTimer, soundDuration, 0, function()
				local player = LocalPlayer()

				if (!IsValid(player) or !player:Alive() or !player:GetCharacter() or
					!player:GetNetVar("brth", false)) then
					FadeHeartbeat()
					return
				end

				if (PLUGIN.heartbeatSoundPatch) then
					PLUGIN.heartbeatSoundPatch:PlayEx(0.35, 100)
				end
			end)
		end
	end

	function PLUGIN:RenderScreenspaceEffects()
		local client = LocalPlayer()
		local targetStrength = 0

		if (IsValid(client) and client:GetCharacter()) then
			local stamina = client:GetLocalVar("stm", 100)
			targetStrength = 1 - math.Clamp(stamina / 25, 0, 1)
		end

		local blend = math.min(FrameTime() * 5, 1)
		self.smoothedToyTownStrength = Lerp(blend, self.smoothedToyTownStrength or 0, targetStrength)

		if (self.smoothedToyTownStrength > 0.001) then
			DrawToyTown(5, ScrH() * self.smoothedToyTownStrength)
		end
	end

	function PLUGIN:ShutDown()
		StopHeartbeat()
	end
end
