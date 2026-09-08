local DATA = {}
DATA.Name = "TEST"
DATA.HoldType = "wos_arrogant_corvinus"
DATA.BaseHoldType = "melee2"
DATA.Translations = {} 

DATA.Translations[ ACT_MP_RUN ] = {
	{ Sequence = "wos_ryoku_r_run", Weight = -10 },
}

DATA.Translations[ ACT_MP_WALK ] = {
	{ Sequence = "walk_knife", Weight = -100 },
}

DATA.Translations[ ACT_MP_SPRINT ] = {
	{ Sequence = "phalanx_r_run", Weight = -10 },
}

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
	{ Sequence = "ryoku_idle_lower", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
	{ Sequence = "wos_bs_shared_jump_descend", Weight = 1 },
}

DATA.Translations[ ACT_MP_CROUCH_IDLE ] = {
	{ Sequence = "couch_idle", Weight = 1 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )
--=====================================================================
