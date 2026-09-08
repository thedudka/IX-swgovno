local DATA = {}
DATA.Name = "melee5"
DATA.HoldType = "wos-meleeelegant-type"
DATA.BaseHoldType = "melee2"
DATA.Translations = {} 

DATA.Translations[ ACT_MP_RUN ] = {
	{ Sequence = "b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_WALK ] = {
	{ Sequence = "b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_SPRINT ] = {
	{ Sequence = "b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
	{ Sequence = "wos_phalanx_r_idle", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
	{ Sequence = "h_jump", Weight = 1 },
}


wOS.AnimExtension:RegisterHoldtype( DATA )
--=====================================================================