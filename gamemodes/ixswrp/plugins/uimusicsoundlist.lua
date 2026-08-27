local PLUGIN = PLUGIN

PLUGIN.name = "Ui and music soundlist"
PLUGIN.author = "dudka"
PLUGIN.description = "Add custom ui and music from star wars."

if CLIENT then
    -- Overrides the default chat tick sound behavior
    local oldPlaySound = chat.PlaySound
    chat.PlaySound = function()
        LocalPlayer():EmitSound("sw_message")
    end
end

	sound.Add({
		name = "sw_buttonclick",
		channel = CHAN_STATIC,
		volume = 0.3,
		level = 80,
		pitch = {90, 105} or 100,
		sound = {
		"ui/ui_click.wav"
		}
	})

    	sound.Add({
		name = "sw_message",
		channel = CHAN_STATIC,
		volume = 0.4,
		level = 80,
		pitch = {90, 105} or 100,
		sound = {
		"ui/ui_message.wav"
		}
	})

        sound.Add({
		name = "sw_notify",
		channel = CHAN_STATIC,
		volume = 0.4,
		level = 80,
		pitch = {90, 105} or 100,
		sound = {
		"ui/ui_notify.wav"
		}
	})

    	sound.Add({
		name = "sw_buttoncancel",
		channel = CHAN_STATIC,
		volume = 0.3,
		level = 80,
		pitch = {90, 105} or 100,
		sound = {
		"ui/ui_cancel.wav"
		}
	})

    	sound.Add({
		name = "sw_buttonrollover",
		channel = CHAN_STATIC,
		volume = 0.2,
		level = 80,
		pitch = {90, 105} or 100,
		sound = {
		"ui/ui_rollover.wav"
		}
	})

        sound.Add({
		name = "sw_back",
		channel = CHAN_STATIC,
		volume = 0.4,
		level = 80,
		pitch = {90, 105} or 100,
		sound = {
		"ui/ui_back.wav"
		}
	})

resource.AddFile("sound/music/mainmenu_theme.wav")

resource.AddFile("sound/ui/ui_cancel.wav")
resource.AddFile("sound/ui/ui_click.wav")
resource.AddFile("sound/ui/ui_message.wav")
resource.AddFile("sound/ui/ui_rollover.wav")
resource.AddFile("sound/ui/ui_back.wav")
resource.AddFile("sound/ui/ui_notify.wav")
