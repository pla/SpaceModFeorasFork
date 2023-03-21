local classicMode = settings.startup["SpaceX-classic-mode"].value or false

data:extend({
	{
		type = "item-group",
		name = "spacex",
		order = "i",
		inventory_order = "z",
		icon = "__SpaceModFeorasFork__/graphics/technology/astrometrics.png",
		icon_size = 128,
	},
	{
		type = "item-subgroup",
		name = "spacex-stage-1",
		group = "spacex",
		order = "a",
	},
	{
		type = "item-subgroup",
		name = "spacex-stage-2",
		group = "spacex",
		order = "b",
	},
	{
		type = "item-subgroup",
		name = "spacex-stage-3",
		group = "spacex",
		order = "c",
	},
	{
		type = "item-subgroup",
		name = "spacex-stage-4",
		group = "spacex",
		order = "d",
	},
	{
		type = "item",
		name = "assembly-robot",
		icon = "__SpaceModFeorasFork__/graphics/icons/assembly-robot.png",
		icon_size = 32,
		subgroup = "spacex-stage-2",
		order = "p[assembly-robot]",
		stack_size = 50,
	},
	{
		type = "item",
		name = "drydock-assembly",
		icon = "__SpaceModFeorasFork__/graphics/icons/drydock-assembly.png",
		icon_size = 32,
		subgroup = "spacex-stage-2",
		order = "q[drydock-assembly]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "drydock-structural",
		icon = "__SpaceModFeorasFork__/graphics/icons/drydock-structural.png",
		icon_size = 32,
		subgroup = "spacex-stage-2",
		order = "r[drydock-structural]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "fusion-reactor",
		icon = "__SpaceModFeorasFork__/graphics/icons/fusion-reactor.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "s[fusion-reactor]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "hull-component",
		icon = "__SpaceModFeorasFork__/graphics/icons/hull-component.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "t[hull-component]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "protection-field",
		icon = "__SpaceModFeorasFork__/graphics/icons/protection-field.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "u[protection-field]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "space-thruster",
		icon = "__SpaceModFeorasFork__/graphics/icons/space-thruster.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "v[space-thruster]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "fuel-cell",
		icon = "__SpaceModFeorasFork__/graphics/icons/fuel-cell.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "w[fuel-cell]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "habitation",
		icon = "__SpaceModFeorasFork__/graphics/icons/habitation.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "x[habitation]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "life-support",
		icon = "__SpaceModFeorasFork__/graphics/icons/life-support.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "y[life-support]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "command",
		icon = "__SpaceModFeorasFork__/graphics/icons/command.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "z-a[command]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "laser-cannon",
		icon = "__SpaceModFeorasFork__/graphics/icons/laser-cannon.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "z-a[laser]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "astrometrics",
		icon = "__SpaceModFeorasFork__/graphics/icons/astrometrics.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "z-b[astrometrics]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "ftl-drive",
		icon = "__SpaceModFeorasFork__/graphics/icons/ftl-drive.png",
		icon_size = 32,
		subgroup = "spacex-stage-3",
		order = "z-c[ftl-drive]",
		stack_size = 1,
	},
	{
		type = "item",
		name = "spacex-combinator",
		icon = "__SpaceModFeorasFork__/graphics/icons/spacex-combinator.png",
		icon_size = 32,
		subgroup = "spacex-stage-1",
		place_result = "spacex-combinator",
		order = "c[combinators]-dd[spacex-combinator]",
		stack_size = 50,
	},
	{
		type = "item",
		name = "spacex-combinator-stage",
		icon = "__SpaceModFeorasFork__/graphics/icons/spacex-combinator-stage.png",
		icon_size = 32,
		subgroup = "spacex-stage-1",
		place_result = "spacex-combinator-stage",
		order = "c[combinators]-ee[spacex-combinator-stage]",
		stack_size = 50,
	},
})

if not classicMode then
	data:extend({
		{
			type = "item",
			name = "exploration-satellite",
			icon = "__SpaceModFeorasFork__/graphics/icons/exploration-satellite.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "m[satellite][exploration-satellite]",
			stack_size = 1,
			rocket_launch_product = { "exploration-data-disk", 1 },
		},
		{
			type = "item",
			name = "exploration-data-disk",
			icon = "__SpaceModFeorasFork__/graphics/icons/exploration-data-disk.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "m[satellite][exploration-satellite][exploration-data-disk]",
			stack_size = 50,
		},
		{
			type = "item",
			name = "space-ai-robot",
			icon = "__SpaceModFeorasFork__/graphics/icons/space-ai-robot.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "z-d[space-ai-robot]",
			stack_size = 1,
		},
		{
			type = "item",
			name = "space-ai-robot-frame",
			icon = "__SpaceModFeorasFork__/graphics/icons/space-ai-robot-frame.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "z-c[space-ai-robot-frame]",
			stack_size = 1,
		},
		{
			type = "item",
			name = "space-water-tank",
			icon = "__SpaceModFeorasFork__/graphics/icons/space-water-tank.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "z-e[space-water-tank]",
			stack_size = 1,
		},
		{
			type = "item",
			name = "space-oxygen-tank",
			icon = "__SpaceModFeorasFork__/graphics/icons/space-oxygen-tank.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "z-e[space-oxygen-tank]",
			stack_size = 1,
		},
		{
			type = "item",
			name = "space-fuel-tank",
			icon = "__SpaceModFeorasFork__/graphics/icons/space-fuel-tank.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "z-e[space-fuel-tank]",
			stack_size = 1,
		},
		{
			type = "item",
			name = "space-oxygen-barrel",
			icon = "__SpaceModFeorasFork__/graphics/icons/space-oxygen-barrel.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "z-e[space-oxygen-barrel]",
			stack_size = 10,
		},
		{
			type = "item",
			name = "space-map",
			icon = "__SpaceModFeorasFork__/graphics/icons/space-map.png",
			icon_size = 32,
			subgroup = "spacex-stage-4",
			order = "z-f[space-map]",
			stack_size = 1,
		},
	})
end
