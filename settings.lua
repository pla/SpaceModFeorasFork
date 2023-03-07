data:extend({
	-- {
	-- type = "string-setting",
	-- name = "SpaceX-game-mode",
	-- setting_type = "startup",
	-- default_value = "Classic",
	-- allowed_values = {"Classic","SpaceX Plus","SpaceX Extreme","Custom"},
	-- admin = true,
	-- description = "SpaceX-game-mode_des",
	-- },
	{
		type = "int-setting",
		name = "SpaceX-research",
		setting_type = "startup",
		default_value = 1,
		allowed_values = { 1, 2, 4, 8, 16 },
		admin = true,
		description = "SpaceX-research-cost",
		order = "1",
	},
	{
		type = "int-setting",
		name = "SpaceX-production",
		setting_type = "startup",
		default_value = 1,
		allowed_values = { 1, 2, 4, 8, 16 },
		admin = true,
		description = "SpaceX-production-cost",
		order = "2",
	},
	{
		type = "string-setting",
		name = "SpaceX-launch-profile",
		setting_type = "startup",
		default_value = "Classic",
		allowed_values = { "Classic", "Launch Mania(x5)", "Launch Meglo-mania(x25)" },
		admin = true,
		description = "SpaceX-launch-profile",
		order = "3",
	},
	{
		type = "bool-setting",
		name = "SpaceX-ignore-tech-multiplier",
		setting_type = "startup",
		default_value = "false",
		admin = true,
		description = "SpaceX-ignore-tech-multiplier",
		order = "4",
	},
	{
		type = "bool-setting",
		name = "SpaceX-no-space-sci",
		setting_type = "startup",
		default_value = "false",
		admin = true,
		description = "SpaceX-no-space-sci",
		order = "5",
	},
	{
		type = "bool-setting",
		name = "SpaceX-cheaper-fusion-reactor",
		setting_type = "startup",
		default_value = "false",
		admin = true,
		description = "SpaceX-cheaper-fusion-reactor",
		order = "6",
	},
	{
		type = "bool-setting",
		name = "SpaceX-no-bob",
		setting_type = "startup",
		default_value = "false",
		admin = true,
		description = "SpaceX-no-bob",
		order = "7",
	},
	{
		type = "bool-setting",
		name = "SpaceX-split-combinator",
		setting_type = "startup",
		default_value = false,
		admin = true,
		description = "SpaceX-split-combinator",
		order = "8",
	},
	{
		type = "bool-setting",
		name = "SpaceX-no-popup",
		setting_type = "runtime-global",
		default_value = "false",
		admin = true,
		description = "SpaceX-no-popup",
		order = "1",
	},
	{
		type = "bool-setting",
		name = "SpaceX-auto-continue",
		setting_type = "runtime-global",
		default_value = "false",
		admin = true,
		description = "SpaceX-auto-continue",
		order = "2",
	},
	{
		type = "bool-setting",
		name = "SpaceX-log-days",
		setting_type = "runtime-per-user",
		default_value = "false",
		description = "SpaceX-log-days",
		order = "1",
	},
})
