
local DATA = {}
DATA.Name = "[LSCS] HoldType Juggernaut"
DATA.HoldType = "wos_versalite_corvinus"
DATA.BaseHoldType = "melee2"
DATA.Translations = {} 

DATA.Translations[ ACT_MP_RUN ] = {
	{ Sequence = "wos_ryoku_r_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_WALK ] = {
	{ Sequence = "walk_knife", Weight = 1 },
}

DATA.Translations[ ACT_MP_SPRINT ] = {
	{ Sequence = "vanguard_h_run", Weight = -3 },
}

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
	{ Sequence = "vanguard_f_idle", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
	{ Sequence = "wos_bs_shared_jump_descend", Weight = 1 },
}

DATA.Translations[ ACT_MP_CROUCH_IDLE ] = {
	{ Sequence = "couch_idle", Weight = 1 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )
