
hook.Add( "AddToolMenuCategories", "SWPing", function()
	spawnmenu.AddToolCategory( "Options", "SW Ping Options", "#StarWars Ping" ) 
end )

hook.Add( "PopulateToolMenu", "SWPingSettingMenu", function()
	spawnmenu.AddToolMenuOption( "Options", "SW Ping Options", "KCMacroOptions", "#Client Settings", "", "", function( panel )
		panel:ClearControls()
		panel:CheckBox("Play the Macrobinoculars place/remove/fail sounds LOCALLY", "macroping_play_base_sounds")
        panel:CheckBox("Play the Macrobinoculars zooming sounds", "macroping_play_zoom_sounds")
		panel:CheckBox("Draw the Macrobinoculars Overlay", "macroping_draw_overlay")
		panel:CheckBox("Draw the Macrobinoculars Sci-Fi effect", "macroping_draw_scifi")
	end )

	spawnmenu.AddToolMenuOption( "Options", "SW Ping Options", "KSMacroOptions", "#Server Settings", "", "", function( panel )
		panel:ClearControls()
		panel:CheckBox("Play the Macrobinoculars place waypoint sound to everyone", "macroping_play_sounds_all")
	end )

end )




if CLIENT then
	surface.CreateFont("WaypointMarkerFont", {
		font = "Trebuchet MS",
		outline = true,
		size = 26
	})

	if not ConVarExists("macroping_play_base_sounds") then
		CreateClientConVar("macroping_play_base_sounds", "1", true, false, "Play the Macrobinoculars place/remove/fail sounds LOCALLY")
	end

	if not ConVarExists("macroping_play_zoom_sounds") then
		CreateClientConVar("macroping_play_zoom_sounds", "1", true, false, "Play the Macrobinoculars zooming sounds")
	end

	if not ConVarExists("macroping_draw_overlay") then
		CreateClientConVar("macroping_draw_overlay", "1", true, false, "Draw the binos overlay")
	end

	if not ConVarExists("macroping_draw_scifi") then
		CreateClientConVar("macroping_draw_scifi", "1", true, false, "Draw the binos sci-fi effect")
	end

	net.Receive("kaito_waypoints_sounds", function ()
		local check = GetConVar("macroping_play_base_sounds"):GetInt() -- noped if convar
		if check != 1 then return end
		sType = net.ReadString() -- getting notif type
		if (sType == "remove") then
			surface.PlaySound("kaito/macroping/waypoint_remove.mp3")
		elseif (sType == "add") then
			surface.PlaySound( "kaito/macroping/waypoint_place.mp3") 
		else
			surface.PlaySound( "kaito/macroping/waypoint_fail.mp3") -- you fuckin failure.
		end
	end)



end


hook.Add("HUDPaint", "Sparks_Macrobinoculars_DrawWaypoints", function()
	local waypoints = ents.FindByClass("waypoint_marker")
	for k, v in ipairs(waypoints) do
		local point = v:GetPos() + v:OBBCenter()
		
		local opacity = (point:DistToSqr(LocalPlayer():GetPos()))^2
		local fade = math.Clamp(((opacity / 4) / 100) * 125, 0, 125)

		local wp_colors = {
			[1] = Color(255, 0, 0, fade),
			[2] = Color(0, 255, 0, fade),
			[3] = Color(0, 0, 255, fade),
			[4] = Color(255, 255, 0, fade),
			[5] = Color(255, 0, 255, fade),
			["black"] = Color(0, 0, 0, fade)
		}

		local scale = math.Clamp(((point:DistToSqr(LocalPlayer():GetPos())) / 500)^2, 15, 20)
		local point2D = point:ToScreen()
		point2D.x = math.Clamp(point2D.x, 0, ScrW())
		point2D.y = math.Clamp(point2D.y, 0, ScrH())
		point2D.visible = true

		-- Corrected Clockwise Winding Order: Top -> Right -> Bottom -> Left
		local diamond = {
			{x = point2D.x + 0 * scale, y = point2D.y - 1 * scale}, -- Top
			{x = point2D.x + 1 * scale, y = point2D.y + 0 * scale}, -- Right
			{x = point2D.x + 0 * scale, y = point2D.y + 1 * scale}, -- Bottom
			{x = point2D.x - 1 * scale, y = point2D.y + 0 * scale}  -- Left
		}

		local border = {
			{x = point2D.x + 0 * scale, y = point2D.y - 1.2 * scale}, -- Top
			{x = point2D.x + 1.2 * scale, y = point2D.y + 0 * scale}, -- Right
			{x = point2D.x + 0 * scale, y = point2D.y + 1.2 * scale}, -- Bottom
			{x = point2D.x - 1.2 * scale, y = point2D.y + 0 * scale}  -- Left
		}

		surface.SetDrawColor(wp_colors["black"])
		surface.DrawPoly(border)

		-- Added fallback in case color variable isn't synchronized yet
		local drawColor = wp_colors[v:GetColorType()] or wp_colors[1]
		surface.SetDrawColor(drawColor)
		surface.DrawPoly(diamond)

		draw.SimpleText(v:GetWaypointName(), "WaypointMarkerFont", point2D.x, point2D.y + -16 - (1 * scale), Color(255, 255, 255, fade), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		local dist = LocalPlayer():GetPos():Distance(v:GetPos())
		local mText = math.Round(dist / 40, 1) .. "m"
		draw.SimpleText(mText, "WaypointMarkerFont", point2D.x, point2D.y + -32 - (1 * scale), Color(255, 255, 255, fade), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end)