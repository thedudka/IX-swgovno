local PLUGIN = PLUGIN

PLUGIN.name = "Dynamic hands"
PLUGIN.description = "Dynamic hands based on the model player currently is using."
PLUGIN.author = ""

if SERVER then

	PLUGIN.CloneModels = {"models/vjsw/galacticrepublic/clones/clonetrooper.mdl", 
"models/vjsw/galacticrepublic/clones/deltasquad/boss.mdl", 
"models/vjsw/galacticrepublic/clones/deltasquad/fixer.mdl", 
"models/vjsw/galacticrepublic/clones/deltasquad/scorch.mdl", 
"models/vjsw/galacticrepublic/clones/deltasquad/sev.mdl", 
"models/vjsw/galacticrepublic/clones/212th_clonetrooper.mdl", 
"models/vjsw/galacticrepublic/clones/2nd_paratrooper.mdl", 
"models/vjsw/galacticrepublic/clones/clone_commando.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_defaut.mdl", 
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_arc.mdl", 
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_engineer.mdl.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_captain.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_commander.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_defaut.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_soldier.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_engineer.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_heavy.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_jet.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_lieutenant.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_rocketeer.mdl", 
"models/vjsw/galacticrepublic/clones/phase1_clonetrooper_sharpshooter.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper_engineer.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper_heavy.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper_jet.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper_lieutenant.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper_rocketeer.mdl", 
"models/vjsw/galacticrepublic/clones/shock_clonetrooper_sharpshooter.mdl", 
"models/vjsw/galacticrepublic/clones/clonetrooper_jet.mdl", 
"models/vjsw/galacticrepublic/clones/clonetrooper_heavy.mdl", 
"models/vjsw/galacticrepublic/clones/clonetrooper_engineer.mdl", 
"models/vjsw/galacticrepublic/clones/clonetrooper_arc_commander.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_arc.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_engineer.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_heavy.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_jet.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_lieutenant.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_rocketeer.mdl",
"models/vjsw/galacticrepublic/clones/212th_clonetrooper_sharpshooter.mdl",
"models/vjsw/galacticrepublic/clones/2nd_paratrooper.mdl",
"models/vjsw/galacticrepublic/clones/2nd_paratrooper_engineer.mdl",
"models/vjsw/galacticrepublic/clones/2nd_paratrooper_heavy.mdl",
"models/vjsw/galacticrepublic/clones/2nd_paratrooper_jet.mdl",
"models/vjsw/galacticrepublic/clones/2nd_paratrooper_lieutenant.mdl",
"models/vjsw/galacticrepublic/clones/2nd_paratrooper_rocketeer.mdl",
"models/vjsw/galacticrepublic/clones/2nd_paratrooper_sharpshooter.mdl",
	}
	PLUGIN.RobotModels = {"models/player/cheddar/swtor/droids/purification_droid.mdl", 
"models/player/cheddar/swtor/droids/bodyguard_droid.mdl", 
"models/player/cheddar/swtor/droids/enforcer_droid.mdl", 
"models/player/cheddar/swtor/droids/heavy_assault_droid.mdl", 
"models/player/cheddar/swtor/droids/hunter_droid.mdl", 
"models/player/cheddar/swtor/droids/slicer_droid.mdl", 
"models/player/cheddar/swtor/droids/temple_guardian_droid.mdl", 
"models/player/cheddar/swtor/droids/welder_droid.mdl", 
"models/player/cheddar/swtor/droids/worker_droid.mdl",
"models/star_wars_battlefront/sides/cis/bx_droid.mdl",
	}
	PLUGIN.DroidModels = {"models/vjsw/confederacyofindependentsystems/battle_droid.mdl", 
"models/vjsw/confederacyofindependentsystems/battle_droid_assassin.mdl", 
"models/vjsw/confederacyofindependentsystems/battle_droid_commander.mdl", 
"models/vjsw/confederacyofindependentsystems/battle_droid_engineer.mdl", 
"models/vjsw/confederacyofindependentsystems/battle_droid_rocketeer.mdl", 
	}
    PLUGIN.MercModels = {"models/player/estrella/shae_vizla.mdl",
	"models/nada/dindjarin.mdl",
	}

do
		for k, model in ipairs(PLUGIN.CloneModels) do
			local shortname = string.StripExtension(string.GetFileFromFilename(model))
			player_manager.AddValidModel(shortname, model)
			player_manager.AddValidHands(shortname, "models/star_wars_battlefront/sides/rep/1st/c_arms_trooper.mdl", 0, "0000000")
		end

		for k, model in ipairs(PLUGIN.RobotModels) do
			local shortname = string.StripExtension(string.GetFileFromFilename(model))
			player_manager.AddValidModel(shortname, model)
			player_manager.AddValidHands(shortname, "models/star_wars_battlefront/sides/cis/1st/c_arms_magna_guard.mdl", 0, "0000000")
		end

		for k, model in ipairs(PLUGIN.DroidModels) do
			local shortname = string.StripExtension(string.GetFileFromFilename(model))
			player_manager.AddValidModel(shortname, model)
			player_manager.AddValidHands(shortname, "models/star_wars_battlefront/sides/cis/1st/c_arms_bdroid.mdl", 1, "0000000")
		end

		for k, model in ipairs(PLUGIN.MercModels) do
			local shortname = string.StripExtension(string.GetFileFromFilename(model))
			player_manager.AddValidModel(shortname, model)
			player_manager.AddValidHands(shortname, "models/star_wars_battlefront/sides/sth/1st/c_arms_trooper.mdl", 1, "0000000")
		end
	end

	function PLUGIN:PlayerLoadedCharacter(client, character, lastchar)
		timer.Simple(3, function()
			hook.Run("PlayerSetHandsModel", client, client:GetHands())
		end)
	end

	function PLUGIN:PlayerModelChanged(client, model, lastmodel)
		timer.Simple(2, function()
			if !isfunction(client.GetCharacter) then return end

			local char = client:GetCharacter()

			if char and IsValid(client:GetHands()) then
				hook.Run("PlayerSetHandsModel", client, client:GetHands())
			end
		end)
	end
end