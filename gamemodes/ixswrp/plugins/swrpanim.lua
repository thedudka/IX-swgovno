local PLUGIN = PLUGIN

PLUGIN.name = "SWRP Animations"
PLUGIN.author = "dudka"
PLUGIN.description = "Set proper model classes to star wars models."

ix.anim = ix.anim or {}

ix.anim.vj_player = {
	normal = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_FIST},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_FIST},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_FIST},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_FIST},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_FIST},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,
		glide = ACT_HL2MP_JUMP_FIST,
		sit = ACT_HL2MP_SIT,
	},
	pistol = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_PISTOL},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_PISTOL},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_PISTOL},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_PISTOL},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
		reload = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
		glide = {ACT_HL2MP_JUMP_PISTOL, ACT_HL2MP_JUMP_PISTOL},
	},
	duel = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_DUEL},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_DUEL},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_DUEL},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_DUEL},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL,
		reload = ACT_HL2MP_GESTURE_RELOAD_DUEL,
		glide = {ACT_HL2MP_JUMP_DUEL, ACT_HL2MP_JUMP_DUEL},
	},
		slam = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_SLAM},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_SLAM},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_SLAM},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_SLAM},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_SLAM},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
		reload = ACT_HL2MP_GESTURE_RELOAD_SLAM,
		glide = {ACT_HL2MP_JUMP_SLAM, ACT_HL2MP_JUMP_SLAM},
	},
	smg = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_SMG1},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_SMG1},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_SMG1},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_SMG1},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_PASSIVE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,
		reload = ACT_HL2MP_GESTURE_RELOAD_SMG1,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_SMG1},
	},
	ar2 = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_AR2},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_AR2},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_AR2},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_AR2},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_PASSIVE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
		reload = ACT_HL2MP_GESTURE_RELOAD_AR2,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_AR2},
	},
	knife = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_KNIFE},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
		glide = {ACT_HL2MP_JUMP_KNIFE, ACT_HL2MP_JUMP_KNIFE},
	},
	shotgun = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_CROSSBOW},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_CROSSBOW},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_CROSSBOW},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_CROSSBOW},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_PASSIVE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,
		reload = ACT_HL2MP_GESTURE_RELOAD_CROSSBOW,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_CROSSBOW},
	},
    	melee = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_MELEE_ANGRY},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_FIST},
	},
    	rpg = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_RPG},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_RPG},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_RPG},
		[ACT_MP_CROUCHWALK] = ACT_HL2MP_WALK_RPG,
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_PASSIVE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG,
		glide = ACT_HL2MP_JUMP_RPG,
	},
	grenade = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_GRENADE},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_GRENADE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_GRENADE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_GRENADE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN},
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_GRENADE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
	},
	["sit"] = "sit",
	["sit_zen"] = "sit_zen",
	vehicle = {
		["prop_vehicle_prisoner_pod"] = {ACT_DRIVE_POD, Vector(-3, 0, 0)},
		["prop_vehicle_jeep"] = {ACT_BUSY_SIT_CHAIR, Vector(14, 0, -14)},
		["prop_vehicle_airboat"] = {ACT_BUSY_SIT_CHAIR, Vector(8, 0, -20)},
		chair = {ACT_HL2MP_SIT, Vector(10, 0, -19)}
	},
}

ix.anim.jedi = {
	normal = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_FIST},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_FIST},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_FIST},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_FIST},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_FIST},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,
		glide = ACT_HL2MP_JUMP_FIST,
		sit = ACT_HL2MP_SIT,
	},
	pistol = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_PISTOL},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_PISTOL},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_PISTOL},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_PISTOL},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_PISTOL},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
		reload = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
		glide = {ACT_HL2MP_JUMP_PISTOL, ACT_HL2MP_JUMP_PISTOL},
	},
		slam = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_SLAM},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_SLAM},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_SLAM},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_SLAM},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_SLAM},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
		reload = ACT_HL2MP_GESTURE_RELOAD_SLAM,
		glide = {ACT_HL2MP_JUMP_SLAM, ACT_HL2MP_JUMP_SLAM},
	},
	duel = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_DUEL},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_DUEL},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_DUEL},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_DUEL},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_DUEL},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL,
		reload = ACT_HL2MP_GESTURE_RELOAD_DUEL,
		glide = {ACT_HL2MP_JUMP_DUEL, ACT_HL2MP_JUMP_DUEL},
	},
	smg = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_SMG1},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_SMG1},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_SMG1},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_SMG1},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_SMG1},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,
		reload = ACT_HL2MP_GESTURE_RELOAD_SMG1,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_SMG1},
	},
	ar2 = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_AR2},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_AR2},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_AR2},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_AR2},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_AR2},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
		reload = ACT_HL2MP_GESTURE_RELOAD_AR2,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_AR2},
	},
	knife = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_KNIFE},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
		glide = {ACT_HL2MP_JUMP_KNIFE, ACT_HL2MP_JUMP_KNIFE},
	},
	shotgun = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_CROSSBOW},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_CROSSBOW},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_CROSSBOW},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_CROSSBOW},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_CROSSBOW},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,
		reload = ACT_HL2MP_GESTURE_RELOAD_CROSSBOW,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_CROSSBOW},
	},
    	melee = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_MELEE_ANGRY},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_KNIFE},
	},
    melee2 = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_MELEE_ANGRY},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_KNIFE},
	},
    	rpg = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_RPG},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_RPG},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_RPG},
		[ACT_MP_CROUCHWALK] = ACT_HL2MP_WALK_RPG,
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_RPG},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG,
		glide = ACT_HL2MP_JUMP_RPG,
	},
	grenade = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_GRENADE},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_GRENADE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_GRENADE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_GRENADE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_GRENADE},
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_GRENADE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
	},
	["sit"] = "sit",
	["sit_zen"] = "sit_zen",
	vehicle = {
		["prop_vehicle_prisoner_pod"] = {ACT_DRIVE_POD, Vector(-3, 0, 0)},
		["prop_vehicle_jeep"] = {ACT_BUSY_SIT_CHAIR, Vector(14, 0, -14)},
		["prop_vehicle_airboat"] = {ACT_BUSY_SIT_CHAIR, Vector(8, 0, -20)},
		chair = {ACT_HL2MP_SIT, Vector(10, 0, -19)}
	},
}

ix.anim.geonosian = {
	normal = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_FIST},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_FIST},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_FIST},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_FIST},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_FIST},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,
		glide = ACT_HL2MP_JUMP_FIST,
		sit = ACT_HL2MP_SIT,
	},
	pistol = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_PISTOL},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_PISTOL},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_PISTOL},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_PISTOL},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_PISTOL},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
		reload = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
		glide = {ACT_HL2MP_JUMP_PISTOL, ACT_HL2MP_JUMP_PISTOL},
	},
		slam = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_SLAM},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_SLAM},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_SLAM},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_SLAM},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_SLAM},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
		reload = ACT_HL2MP_GESTURE_RELOAD_SLAM,
		glide = {ACT_HL2MP_JUMP_SLAM, ACT_HL2MP_JUMP_SLAM},
	},
	duel = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_DUEL},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_DUEL},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_DUEL},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_DUEL},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_DUEL},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL,
		reload = ACT_HL2MP_GESTURE_RELOAD_DUEL,
		glide = {ACT_HL2MP_JUMP_DUEL, ACT_HL2MP_JUMP_DUEL},
	},
	smg = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_SMG1},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_SMG1},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_SMG1},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_SMG1},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_SMG1},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,
		reload = ACT_HL2MP_GESTURE_RELOAD_SMG1,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_SMG1},
	},
	ar2 = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_AR2},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_AR2},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_AR2},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_AR2},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_AR2},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
		reload = ACT_HL2MP_GESTURE_RELOAD_AR2,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_AR2},
	},
	knife = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_KNIFE},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
		glide = {ACT_HL2MP_JUMP_KNIFE, ACT_HL2MP_JUMP_KNIFE},
	},
	shotgun = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_CROSSBOW},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_CROSSBOW},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_CROSSBOW},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH_PASSIVE, ACT_HL2MP_WALK_CROUCH_CROSSBOW},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_CROSSBOW},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,
		reload = ACT_HL2MP_GESTURE_RELOAD_CROSSBOW,
		glide = {ACT_HL2MP_JUMP_PASSIVE, ACT_HL2MP_JUMP_CROSSBOW},
	},
    	melee = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_MELEE},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_KNIFE},
	},
    melee2 = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_MELEE_ANGRY},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_KNIFE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_KNIFE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_KNIFE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_KNIFE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_KNIFE},
	},
    	rpg = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE_PASSIVE, ACT_HL2MP_IDLE_RPG},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH_PASSIVE, ACT_HL2MP_IDLE_CROUCH_RPG},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK_PASSIVE, ACT_HL2MP_WALK_RPG},
		[ACT_MP_CROUCHWALK] = ACT_HL2MP_WALK_RPG,
		[ACT_MP_RUN] = {ACT_HL2MP_RUN_PASSIVE, ACT_HL2MP_RUN_RPG},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG,
		glide = ACT_HL2MP_JUMP_RPG,
	},
	grenade = {
		[ACT_MP_STAND_IDLE] = {ACT_HL2MP_IDLE, ACT_HL2MP_IDLE_GRENADE},
		[ACT_MP_CROUCH_IDLE] = {ACT_HL2MP_IDLE_CROUCH, ACT_HL2MP_IDLE_CROUCH_GRENADE},
		[ACT_MP_WALK] = {ACT_HL2MP_WALK, ACT_HL2MP_WALK_GRENADE},
		[ACT_MP_CROUCHWALK] = {ACT_HL2MP_WALK_CROUCH, ACT_HL2MP_WALK_CROUCH_GRENADE},
		[ACT_MP_RUN] = {ACT_HL2MP_RUN, ACT_HL2MP_RUN_GRENADE},
		glide = {ACT_HL2MP_JUMP_FIST, ACT_HL2MP_JUMP_GRENADE},
		attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
	},
	["sit"] = "sit",
	["sit_zen"] = "sit_zen",
	vehicle = {
		["prop_vehicle_prisoner_pod"] = {ACT_DRIVE_POD, Vector(-3, 0, 0)},
		["prop_vehicle_jeep"] = {ACT_BUSY_SIT_CHAIR, Vector(14, 0, -14)},
		["prop_vehicle_airboat"] = {ACT_BUSY_SIT_CHAIR, Vector(8, 0, -20)},
		chair = {ACT_HL2MP_SIT, Vector(10, 0, -19)}
	},
}

ix.anim.alienswarmdrone = {
    normal = {
        [ACT_MP_STAND_IDLE] = {ACT_IDLE, ACT_IDLE},
        [ACT_MP_CROUCH_IDLE] = {ACT_IDLE, ACT_RUN},
        [ACT_MP_WALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_CROUCHWALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_RUN] = {ACT_RUN, ACT_RUN},
        attack = ACT_MELEE_ATTACK1,
        glide = ACT_GLIDE,
        sit = ACT_HL2MP_SIT,
    },
	knife = {
        [ACT_MP_STAND_IDLE] = {ACT_IDLE, ACT_IDLE},
        [ACT_MP_CROUCH_IDLE] = {ACT_IDLE, ACT_RUN},
        [ACT_MP_WALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_CROUCHWALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_RUN] = {ACT_RUN, ACT_RUN},
        attack = ACT_MELEE_ATTACK2,
        glide = ACT_GLIDE,
	},
    	melee = {
        [ACT_MP_STAND_IDLE] = {ACT_IDLE, ACT_IDLE},
        [ACT_MP_CROUCH_IDLE] = {ACT_IDLE, ACT_RUN},
        [ACT_MP_WALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_CROUCHWALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_RUN] = {ACT_RUN, ACT_RUN},
        attack = ACT_MELEE_ATTACK2,
        glide = ACT_GLIDE,
	},
    melee2 = {
        [ACT_MP_STAND_IDLE] = {ACT_IDLE, ACT_IDLE},
        [ACT_MP_CROUCH_IDLE] = {ACT_IDLE, ACT_RUN},
        [ACT_MP_WALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_CROUCHWALK] = {ACT_RUN, ACT_RUN},
        [ACT_MP_RUN] = {ACT_RUN, ACT_RUN},
        attack = ACT_MELEE_ATTACK2,
        glide = ACT_GLIDE,
}
}

// clones
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/clonetrooper.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/deltasquad/boss.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/deltasquad/fixer.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/deltasquad/scorch.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/deltasquad/sev.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/212th_clonetrooper.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/2nd_paratrooper.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/clone_commando.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_defaut.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/212th_clonetrooper_arc.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/212th_clonetrooper_engineer.mdl.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_captain.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_commander.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_defaut.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_arc_soldier.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_engineer.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_heavy.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_jet.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_lieutenant.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_rocketeer.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/phase1_clonetrooper_sharpshooter.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper_engineer.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper_heavy.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper_jet.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper_lieutenant.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper_rocketeer.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/shock_clonetrooper_sharpshooter.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/clonetrooper_jet.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/clonetrooper_heavy.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/galacticrepublic/clones/clonetrooper_engineer.mdl", "vj_player")

// jedi
ix.anim.SetModelClass("models/cyanblue/genshin_impact/thicc_venti/thicc_venti.mdl", "jedi")
ix.anim.SetModelClass("models/player/jesusstar/jdun/jdun.mdl", "jedi")
ix.anim.SetModelClass("models/player/reaps/jediacc/zabrakf.mdl", "jedi")

// battledroids
ix.anim.SetModelClass("models/vjsw/confederacyofindependentsystems/battle_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/confederacyofindependentsystems/battle_droid_assassin.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/confederacyofindependentsystems/battle_droid_commander.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/confederacyofindependentsystems/battle_droid_engineer.mdl", "vj_player")
ix.anim.SetModelClass("models/vjsw/confederacyofindependentsystems/battle_droid_rocketeer.mdl", "vj_player")

// droids
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/purification_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/bodyguard_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/enforcer_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/heavy_assault_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/hunter_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/slicer_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/temple_guardian_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/welder_droid.mdl", "vj_player")
ix.anim.SetModelClass("models/player/cheddar/swtor/droids/worker_droid.mdl", "vj_player")

ix.anim.SetModelClass("models/star_wars_battlefront/sides/geo/geonosian.mdl", "geonosian")
ix.anim.SetModelClass("models/vj_alienswarm/drone.mdl", "alienswarmdrone")