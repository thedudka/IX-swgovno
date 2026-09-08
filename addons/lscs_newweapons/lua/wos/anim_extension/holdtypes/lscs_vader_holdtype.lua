
local DATA = {}
DATA.Name = "[LSCS] HoldType Vader"
DATA.HoldType = "lscs_vader"
DATA.BaseHoldType = "melee"
DATA.Translations = {} 
DATA.Translations[ ACT_MP_STAND_IDLE ] = "vader_idle"
DATA.Translations[ ACT_MP_RUN ] = {
	{ Sequence = "b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_WALK ] = {
	{ Sequence = "b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_SPRINT ] = {
	{ Sequence = "b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
	{ Sequence = "h_jump", Weight = 1 },
}
wOS.AnimExtension:RegisterHoldtype( DATA )
