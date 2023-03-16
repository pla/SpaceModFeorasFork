data:extend({
	{
		type = "double-setting",
		name = "SpaceX-research",
		setting_type = "startup",
		default_value = 1,
		allowed_values = { 0.25, 0.5, 0.75, 1, 2, 4, 8, 16 },
		admin = true,
		description = "SpaceX-research",
		order = "1",
	},
	{
		type = "double-setting",
		name = "SpaceX-production",
		setting_type = "startup",
		default_value = 1,
		allowed_values = { 0.25, 0.5, 0.75, 1, 2, 4, 8, 16 },
		admin = true,
		description = "SpaceX-production",
		order = "2",
	},
	{
		type = "double-setting",
		name = "SpaceX-launch-multiplier",
		setting_type = "startup",
		default_value = 1,
		allowed_values = { 0.25, 0.5, 0.75, 1, 2, 5, 10, 25 },
		admin = true,
		description = "SpaceX-launch-multiplier",
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
		name = "SpaceX-no-nuclear",
		setting_type = "startup",
		default_value = "false",
		admin = true,
		description = "SpaceX-no-nuclear",
		order = "6",
	},
	{
		type = "bool-setting",
		name = "SpaceX-cheaper-fusion-reactor",
		setting_type = "startup",
		default_value = "false",
		admin = true,
		description = "SpaceX-cheaper-fusion-reactor",
		order = "7",
	},
	{
		type = "bool-setting",
		name = "SpaceX-no-bob",
		setting_type = "startup",
		default_value = "false",
		admin = true,
		description = "SpaceX-no-bob",
		order = "8",
	},
	{
		type = "bool-setting",
		name = "SpaceX-split-combinator",
		setting_type = "startup",
		default_value = false,
		admin = true,
		description = "SpaceX-split-combinator",
		order = "9",
	},
	{
		type = "bool-setting",
		name = "SpaceX-classic-mode",
		setting_type = "startup",
		default_value = false,
		admin = true,
		description = "SpaceX-classic-mode",
		order = "91",
	},
	{
		type = "bool-setting",
		name = "SpaceX-no-popup",
		setting_type = "runtime-global",
		default_value = "true",
		admin = true,
		description = "SpaceX-no-popup",
		order = "1",
	},
	{
		type = "bool-setting",
		name = "SpaceX-auto-continue",
		setting_type = "runtime-global",
		default_value = "true",
		admin = true,
		description = "SpaceX-auto-continue",
		order = "2",
	},
	{
		type = "bool-setting",
		name = "SpaceX-no-chat-msg",
		setting_type = "runtime-global",
		default_value = "true",
		admin = true,
		description = "SpaceX-no-chat-msg",
		order = "3",
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
