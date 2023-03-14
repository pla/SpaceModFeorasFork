require("util")
require("milestones")

local mod_gui = require("mod-gui")

MOD_NAME = "SpaceMod"

global = global or {}

-- DEBUG
local function debugp(text)
	if __DebugAdapter then
		__DebugAdapter.print("[SPACEX] " .. text)
	end
end

local function gui_open_spacex(player)
	local frame = mod_gui.get_frame_flow(player).space_progress_frame
	if not frame then
		return
	end
	frame.clear()

	-- Launch history, if any
	if global.completed > 0 then
		local launch =
			frame.add({ type = "table", name = "launch_info", column_count = 2, style = "SpaceMod_item_table_style" })
		launch.add({ type = "label", caption = { "instellar-launch", global.completed }, style = "caption_label" })
		local log_button = launch.add({
			type = "button",
			name = "launch_log",
			style = mod_gui.button_style,
			caption = { "spacex-log-caption" },
			tooltip = { "spacex-log-tooltip" },
		})
		log_button.style.height = 30
	end

	-- Current required items to launch
	local current_stage = global.stages[global.current_stage]
	frame.add({
		type = "label",
		caption = { "stage-" .. current_stage.number .. "-progress-stage", table_size(global.stages) },
		style = "caption_label",
	})
	local items_to_launch = frame.add({
		type = "table",
		name = "stage-" .. current_stage.number,
		column_count = 2,
		style = "SpaceMod_item_table_style",
	})
	items_to_launch.style.column_alignments[2] = "center"
	items_to_launch.draw_horizontal_lines = true
	items_to_launch.draw_vertical_lines = true
	items_to_launch.draw_horizontal_line_after_headers = true
	items_to_launch.add({
		type = "label",
		caption = { "stage-" .. current_stage.number .. "-progress-title" },
		style = "caption_label",
	})
	items_to_launch.add({ type = "label", caption = { "progress-title" }, style = "caption_label" })
	for _, item in pairs(current_stage.requirements) do
		items_to_launch.add({ type = "label", caption = { "SpaceX-Progress." .. item.item_name } })
		items_to_launch.add({ type = "label", caption = item.launched .. "/" .. item.required })
	end
end

local function update_combinator(combinator)
	if combinator.valid == true then
		local cb = combinator.get_or_create_control_behavior()

		local is_stage_combinator = combinator.name == "spacex-combinator-stage"
		local split_signal = settings.startup["SpaceX-split-combinator"].value
		local append_items = not is_stage_combinator
		local append_stage = (split_signal and is_stage_combinator) or (not split_signal and not is_stage_combinator)

		local current_stage = global.stages[global.current_stage]
		local signals = {}
		if append_items then
			for i, item in pairs(current_stage.requirements) do
				table.insert(signals, {
					signal = {
						type = "item",
						name = item.item_name,
					},
					count = item.required - item.launched,
					index = i,
				})
			end
		end
		if append_stage then
			table.insert(signals, {
				signal = {
					type = "virtual",
					name = "signal-S",
				},
				count = current_stage.number,
				index = table_size(signals) + 1,
			})
		end
		cb.parameters = signals
	end
end

local function update_all_combinators()
	for _, spacexCom in pairs(global.combinators) do
		debugp("spacex combinator found")
		update_combinator(spacexCom.entity)
	end
end

local function init_launch_multiplier()
	if global.launch_mult ~= settings.startup["SpaceX-launch-multiplier"].value then
		global.launch_mult = settings.startup["SpaceX-launch-multiplier"].value or 1
		for _, stage in pairs(global.stages) do
			for _, item in pairs(stage.requirements) do
				item.required = item.base_required * global.launch_mult
			end
		end
		for _, player in pairs(game.players) do
			gui_open_spacex(player)
		end
	end
end

local function init_stages()
	if global.stages == nil then
		global.stages = {
			{
				number = 1,
				requirements = { { item_name = "satellite", base_required = 7, launched = 0 } },
			},
			{
				number = 2,
				requirements = {
					{ item_name = "drydock-structural", base_required = 10, launched = 0 },
					{ item_name = "drydock-assembly", base_required = 2, launched = 0 },
				},
			},
			{
				number = 3,
				requirements = {
					{ item_name = "protection-field", base_required = 1, launched = 0 },
					{ item_name = "fusion-reactor", base_required = 1, launched = 0 },
					{ item_name = "habitation", base_required = 1, launched = 0 },
					{ item_name = "life-support", base_required = 1, launched = 0 },
					{ item_name = "astrometrics", base_required = 1, launched = 0 },
					{ item_name = "command", base_required = 1, launched = 0 },
					{ item_name = "fuel-cell", base_required = 2, launched = 0 },
					{ item_name = "laser-cannon", base_required = 2, launched = 0 },
					{ item_name = "space-thruster", base_required = 4, launched = 0 },
					{ item_name = "hull-component", base_required = 10, launched = 0 },
					{ item_name = "ftl-drive", base_required = 1, launched = 0 },
				},
			},
			{
				number = 4,
				requirements = {
					{ item_name = "exploration-satellite", base_required = 20, launched = 0 },
					{ item_name = "space-ai-robot", base_required = 2, launched = 0 },
					{ item_name = "space-water-tank", base_required = 2, launched = 0 },
					{ item_name = "space-oxygen-tank", base_required = 2, launched = 0 },
					{ item_name = "space-fuel-tank", base_required = 2, launched = 0 },
					{ item_name = "space-map", base_required = 1, launched = 0 },
				},
			},
		}
	end
end

local function init_spacex()
	init_stages()
	global.current_stage = global.current_stage or 1
	init_launch_multiplier()
	global.finished = global.finished or false
	global.combinators = global.combinators or {}
	global.completed = global.completed or 0
	global.launch_log = global.launch_log or {}
	update_all_combinators()
end

local function init_gui(player, after_research)
	local button = mod_gui.get_button_flow(player).space_toggle_button
	if button then
		if player.force.technologies["rocket-silo"].researched ~= true then
			button.destroy()
		end
		return
	end

	if player.force.technologies["rocket-silo"].researched or after_research then
		mod_gui.get_button_flow(player).add({
			type = "button",
			name = "space_toggle_button",
			style = mod_gui.button_style,
			caption = { "space-toggle-button-caption" },
		})
	end
end

script.on_configuration_changed(function(event)
	global.launch_mult = nil
	init_spacex()
	local changed = event.mod_changes
	if changed then
		debugp("Processing mod change")
		global.combinators = {}
		-- Add existing combinators to global
		for _, surface in pairs(game.surfaces) do
			debugp("Surface found")
			for _, spacexCom in
				pairs(surface.find_entities_filtered({ type = "constant-combinator", name = "spacex-combinator" }))
			do
				debugp("Found an old spacex combinator")
				table.insert(global.combinators, { entity = spacexCom })
			end
			for _, spacexCom in
				pairs(
					surface.find_entities_filtered({ type = "constant-combinator", name = "spacex-combinator-stage" })
				)
			do
				debugp("Found an old spacex combinator stage")
				table.insert(global.combinators, { entity = spacexCom })
			end
		end
		if game.players ~= nil then
			for _, player in pairs(game.players) do
				local frame = player.gui.left["space-progress-frame"]
				if frame then
					frame.destroy()
				end
				local button = player.gui.top["space-toggle-button"]
				if button then
					button.destroy()
				end
				init_gui(player, player.force.technologies["rocket-silo"].researched)
				debugp("Mod version changed processed")
			end
		end
		for _, force in pairs(game.forces) do
			if force.technologies["space-assembly"].researched then
				-- Migration to enable recipe
				force.recipes["spacex-combinator"].enabled = true
				if settings.startup["SpaceX-split-combinator"].value then
					-- Enabled, was disabled before. Migration
					if force.recipes["spacex-combinator-stage"].enabled == false then
						force.recipes["spacex-combinator-stage"].enabled = true
						update_all_combinators()
					end
				else
					-- Disabled, was enabled before. Migration
					if force.recipes["spacex-combinator-stage"].enabled == true then
						force.recipes["spacex-combinator-stage"].enabled = false
						update_all_combinators()
					end
				end
			end
		end
	end
end)

local function gui_open_spacex_completed(player)
	local gui = mod_gui.get_frame_flow(player)
	local gui_spacex = gui.spacex_launch
	if gui_spacex then
		gui_spacex.destroy()
		return
	end
	gui_spacex = gui.add({
		type = "frame",
		name = "spacex_launch",
		direction = "vertical",
		style = mod_gui.frame_style,
	})
	if not gui_spacex then
		return
	end
	gui_spacex.clear()
	gui_spacex.add({ type = "label", caption = { "spacex-launch-title" }, style = "caption_label" })
	gui_spacex.add({ type = "label", caption = { "spacex-completion-text" }, style = "Launch_label_style" })
	gui_spacex.add({ type = "label", caption = " ", style = "Launch_label_style" })
	for i = 1, 4 do
		gui_spacex.add({ type = "label", caption = { "spacex-completion-text" .. i }, style = "Launch_label_style" })
		gui_spacex.add({ type = "label", caption = " ", style = "Launch_label_style" })
	end
	if player.admin then
		local sctable = gui_spacex.add({
			type = "table",
			name = "spacex_launch_table",
			column_count = 2,
			style = "SpaceMod_table_style",
		})
		sctable.style.minimal_width = 400
		sctable.style.horizontally_stretchable = "on"
		sctable.style.column_alignments[2] = "right"
		sctable.add({
			type = "button",
			name = "spacex_continue_button",
			style = mod_gui.button_style,
			caption = { "spacex-continue-caption" },
			tooltip = { "spacex-continue-tooltip" },
		})
		sctable.add({
			type = "button",
			name = "spacex_finish_button",
			style = mod_gui.button_style,
			caption = { "spacex-finish-caption" },
			tooltip = { "spacex-finish-tooltip" },
		})
	else
		gui_spacex.add({
			type = "button",
			name = "notadmin_button",
			style = mod_gui.button_style,
			caption = { "spacex-notadmin-caption" },
			tooltip = { "spacex-notadmin-tooltip" },
		})
	end
end

local function format_launch_log(ticks, player)
	local seconds = math.floor(ticks / 60)
	local minutes = math.floor(seconds / 60)
	local hours = math.floor(minutes / 60)

	local show_days = settings.get_player_settings(player)["SpaceX-log-days"].value or false
	if show_days then
		local days = math.floor(hours / 24)
		return string.format("%dd %02dh %02dm %02ds", days, hours % 24, minutes % 60, seconds % 60)
	else
		return string.format("%dh %02dm %02ds", hours, minutes % 60, seconds % 60)
	end
end

local function gui_open_log(player)
	local gui = mod_gui.get_frame_flow(player)
	local llog = gui.spacex_log
	if not llog then
		return
	end
	local scroll = llog.add({ type = "scroll-pane", name = "scroll" })
	scroll.style.maximal_height = 600
	local logtable =
		scroll.add({ type = "table", name = "spacex_log_table", column_count = 3, style = "SpaceMod_table_style" })
	logtable.style.column_alignments[1] = "center"
	logtable.style.column_alignments[2] = "center"
	logtable.draw_horizontal_lines = true
	logtable.draw_vertical_lines = true
	logtable.draw_horizontal_line_after_headers = true
	logtable.add({ type = "label", caption = { "spacex-log-launch" }, style = "caption_label" })
	logtable.add({ type = "label", caption = { "spacex-log-time" }, style = "caption_label" })
	logtable.add({ type = "label", caption = { "spacex-log-notes" }, style = "caption_label" })
	for i = table_size(global.launch_log), 1, -1 do
		local launch = global.launch_log[i]
		logtable.add({ type = "label", caption = launch.number, style = "Launch_label_style" })
		logtable.add({ type = "label", caption = format_launch_log(launch.log, player), style = "Launch_label_style" })
		logtable.add({ type = "textfield", name = "spacex-logdetail" .. i, enabled = player.admin, text = launch.detail })
	end
end

script.on_event(defines.events.on_gui_text_changed, function(event)
	local element = event.element
	local player = game.players[event.player_index]

	if string.find(element.name, "spacex-logdetail") then
		if player.admin then
			local cur_log = tonumber(string.match(element.name, "%d+"))
			global.launch_log[cur_log].detail = element.text
		end
	end
end)

local function remove_combinator(entity)
	for i, combinator in ipairs(global.combinators) do
		if combinator.entity == entity then
			table.remove(global.combinators, i)
			return
		end
	end
end

local function on_entity_build(event)
	debugp("Spacex combinator built")
	event.created_entity.operable = false
	table.insert(global.combinators, { entity = event.created_entity })
	update_combinator(event.created_entity)
end
script.on_event(defines.events.on_built_entity, on_entity_build, {
	{ filter = "name", name = "spacex-combinator", mode = "or" },
	{ filter = "name", name = "spacex-combinator-stage", mode = "or" },
})
script.on_event(defines.events.on_robot_built_entity, on_entity_build, {
	{ filter = "name", name = "spacex-combinator", mode = "or" },
	{ filter = "name", name = "spacex-combinator-stage", mode = "or" },
})

local function on_entity_cloned(event)
	debugp("Spacex combinator cloned")
	event.destination.operable = false
	table.insert(global.combinators, { entity = event.destination })
	update_combinator(event.destination)
end
script.on_event(defines.events.on_entity_cloned, on_entity_cloned, {
	{ filter = "name", name = "spacex-combinator", mode = "or" },
	{ filter = "name", name = "spacex-combinator-stage", mode = "or" },
})

local function on_remove_entity(event)
	remove_combinator(event.entity)
end
script.on_event(defines.events.on_pre_player_mined_item, on_remove_entity, {
	{ filter = "name", name = "spacex-combinator", mode = "or" },
	{ filter = "name", name = "spacex-combinator-stage", mode = "or" },
})
script.on_event(defines.events.on_robot_pre_mined, on_remove_entity, {
	{ filter = "name", name = "spacex-combinator", mode = "or" },
	{ filter = "name", name = "spacex-combinator-stage", mode = "or" },
})
script.on_event(defines.events.on_entity_died, on_remove_entity, {
	{ filter = "name", name = "spacex-combinator", mode = "or" },
	{ filter = "name", name = "spacex-combinator-stage", mode = "or" },
})

local function spacex_continue(surface)
	global.stages = nil
	global.launch_mult = nil
	global.current_stage = nil
	init_spacex()
	global.completed = global.completed + 1
	local launch_log = { log = game.ticks_played, detail = "", number = global.completed }
	table.insert(global.launch_log, launch_log)

	-- Show hint message for auto-continue and disable popups
	if global.completed == 1 then
		for _, player in pairs(game.players) do
			if player ~= nil then
				if player.admin then
					if settings.global["SpaceX-no-popup"].value == false then
						local gui = mod_gui.get_frame_flow(player)
						local gui_continue_hint = gui.continue_hint_msg
						gui_continue_hint = gui.add({
							type = "frame",
							name = "continue_hint_msg",
							direction = "vertical",
							caption = { "continue-hint-title" },
							style = mod_gui.frame_style,
						})
						gui_continue_hint.add({
							type = "label",
							caption = { "continue-hint-text" },
							style = "Launch_label_style",
						})
						gui_continue_hint.add({
							type = "button",
							name = "continue_hint_button",
							style = mod_gui.button_style,
							caption = { "continue-hint-caption" },
							tooltip = { "continue-hint-tooltip" },
						})
					end
				end
			end
		end
	end
end

local function gui_open_stage_complete(player, stage_number)
	local gui = mod_gui.get_frame_flow(player)
	local gui_stage = gui["completion_stage_" .. stage_number]
	if gui_stage then
		gui_stage.destroy()
		return
	end

	gui_stage = gui.add({
		type = "frame",
		name = "completion_stage_" .. stage_number,
		direction = "vertical",
		caption = { "stage-" .. stage_number .. "-completion-title" },
		style = mod_gui.frame_style,
	})
	gui_stage.add({
		type = "label",
		caption = { "stage-" .. stage_number .. "-completion-text" },
		style = "Launch_label_style",
	})
	gui_stage.add({
		type = "button",
		name = "completion_stage_" .. stage_number .. "_button",
		style = mod_gui.button_style,
		caption = { "stage-" .. stage_number .. "-completion-caption" },
		tooltip = { "stage-" .. stage_number .. "-completion-tooltip" },
	})
end

script.on_event(defines.events.on_gui_click, function(event)
	local element = event.element
	local player = game.players[event.player_index]
	local gui = mod_gui.get_frame_flow(player)
	local frame = gui.space_progress_frame
	local gui_spacex = gui.spacex_launch
	local spacex_log = gui.spacex_log

	if element.name == "space_toggle_button" then
		if frame then
			frame.destroy()
			if spacex_log then
				spacex_log.destroy()
			end
			return
		end
		frame = gui.add({
			type = "frame",
			name = "space_progress_frame",
			direction = "vertical",
			caption = { "space-progress-frame-title" },
			style = mod_gui.frame_style,
		})
		gui_open_spacex(player)
	elseif element.name == "spacex_continue_button" then
		for _, player in pairs(game.players) do
			-- Close every launch gui
			gui_open_spacex_completed(player)
		end
		spacex_continue(player.surface)
		if frame then
			frame.destroy()
		end
		if gui_spacex then
			gui_spacex.destroy()
		end
		frame = gui.add({
			type = "frame",
			name = "space_progress_frame",
			direction = "vertical",
			caption = { "space-progress-frame-title" },
			style = mod_gui.frame_style,
		})
		gui_open_spacex(player)
	elseif element.name == "spacex_finish_button" then
		for _, player in pairs(game.players) do
			-- Close every launch gui
			gui_open_spacex_completed(player)
		end
		if gui_spacex then
			gui_spacex.destroy()
		end
		game.set_game_state({ game_finished = true, player_won = true, can_continue = true })
		global.finished = true
	elseif element.name == "launch_log" then
		if spacex_log then
			spacex_log.destroy()
			return
		end
		spacex_log = gui.add({
			type = "frame",
			name = "spacex_log",
			direction = "vertical",
			caption = { "gui-log-title" },
			style = mod_gui.frame_style,
		})
		gui_open_log(player)
	elseif element.name == "completion_stage_1_button" then
		gui_open_stage_complete(player, 1)
	elseif element.name == "completion_stage_2_button" then
		gui_open_stage_complete(player, 2)
	elseif element.name == "completion_stage_3_button" then
		gui_open_stage_complete(player, 3)
	elseif element.name == "notadmin_button" then
		gui_open_spacex_completed(player)
	elseif element.name == "continue_hint_button" then
		local gui_continue_hint = gui.continue_hint_msg
		if gui_continue_hint then
			gui_continue_hint.destroy()
		end
	end
end)

script.on_event(defines.events.on_player_created, function(event)
	init_gui(game.players[event.player_index], false)
end)

script.on_event(defines.events.on_research_finished, function(event)
	if event.research.name == "rocket-silo" then
		for _, player in pairs(game.players) do
			init_gui(player, true)
		end
	end
end)

script.on_init(function()
	init_spacex()
	for _, player in pairs(game.players) do
		init_gui(player, false)
	end
end)

local function check_stage_completed(stage)
	for _, item in pairs(stage.requirements) do
		if item.launched < item.required then
			return false
		end
	end
	return true
end

script.on_event(defines.events.on_rocket_launched, function(event)
	if remote.interfaces["silo_script"] then
		remote.call("silo_script", "set_no_victory", true)
	end
	game.set_game_state({ game_finished = false, player_won = false, can_continue = true })

	local current_stage = global.stages[global.current_stage]
	for _, item in pairs(current_stage.requirements) do
		if event.rocket.get_item_count(item.item_name) > 0 then
			if item.launched < item.required then
				item.launched = item.launched + 1
			end
		end
	end

	for i = global.current_stage, table_size(global.stages), 1 do
		if check_stage_completed(global.stages[i]) then
			-- Check for spacex completion
			if current_stage.number == table_size(global.stages) then
				if settings.global["SpaceX-auto-continue"].value == false then
					for _, player in pairs(game.players) do
						player.print({ "spacex-completion-msg" })
						gui_open_spacex_completed(player)
					end
				else
					spacex_continue(event.rocket.surface)
				end
			-- Stage completion
			else
				for _, player in pairs(game.players) do
					player.print({ "stage-" .. current_stage.number .. "-completion-msg" })
					if settings.global["SpaceX-no-popup"].value == false then
						gui_open_stage_complete(player, current_stage.number)
					end
				end
				global.current_stage = global.stages[i].number + 1
			end
		else
			break
		end
	end

	for _, player in pairs(game.players) do
		local frame = mod_gui.get_frame_flow(player).space_progress_frame
		if frame then
			gui_open_spacex(player)
		end
	end
	update_all_combinators()
end)

commands.add_command("SpaceX_reset", { "resetSpaceX_help" }, function(event)
	global.finished = false
	global.stages = nil
	global.current_stage = nil
	global.launch_mult = nil
	init_spacex()
end)

commands.add_command("SpaceX_write_log_file", { "get log file help" }, function(event)
	game.write_file("spacex_log", serpent.block(global.launch_log))
end)

-- Cheat commands
if __DebugAdapter then
	local function cheat_complete_stage()
		for _, item in pairs(global.stages[global.current_stage].requirements) do
			item.launched = item.required
		end
		local stage_req = global.stages[global.current_stage].requirements
		stage_req[table_size(stage_req)].launched = stage_req[table_size(stage_req)].required - 1
		update_all_combinators()
		for _, player in pairs(game.players) do
			gui_open_spacex(player)
		end
	end

	-- For every stage create a complete command
	for i = 1, 4 do
		commands.add_command("SpaceX_complete_stage_" .. i, { "SpaceX_cheat_sat_help" }, function(event)
			global.current_stage = i
			cheat_complete_stage()
		end)
	end

	commands.add_command("SpaceX_write_combinators", { "get spacex_combinator help" }, function(event)
		game.write_file("spacex_combinator", serpent.block(global.combinators))
	end)

	commands.add_command("SpaceX_modlist", { "modlist_help" }, function(event)
		for name, version in pairs(game.active_mods) do
			game.player.print(name .. " version " .. version)
		end
	end)
end
