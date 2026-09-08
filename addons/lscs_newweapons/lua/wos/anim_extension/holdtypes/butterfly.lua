
local DATA = {}
DATA.Name = "[LSCS] HoldType Butterfly"
DATA.HoldType = "wos_butterfly_corvinus"
DATA.BaseHoldType = "melee2"
DATA.Translations = {} 
DATA.Translations[ ACT_MP_STAND_IDLE ] = "vanguard_f_idle"
DATA.Translations[ ACT_MP_WALK ] = "walk_knife"
DATA.Translations[ ACT_MP_RUN ] = "run_knife"
DATA.Translations[ ACT_MP_JUMP ] = "wos_bs_shared_jump_descend"
DATA.Translations[ ACT_MP_CROUCH_IDLE ] = {
	{ Sequence = "couch_idle", Weight = 1 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )
