local researchCost = settings.startup["SpaceX-research"].value or 1
local ignoreMult = settings.startup["SpaceX-ignore-tech-multiplier"].value or false

local marathon_adj
if ignoreMult then
	marathon_adj = 4
else
	marathon_adj = 1
end

data:extend({
	{
		type = "technology",
		name = "space-assembly",
		icon = "__SpaceModFeoras__/graphics/technology/space-assembly.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "assembly-robot",
			},
			{
				type = "unlock-recipe",
				recipe = "spacex-combinator",
			},
		},
		prerequisites = { "rocket-silo" },
		unit = {
			count = 6000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-b",
	},
	{
		type = "technology",
		name = "space-construction",
		icon = "__SpaceModFeoras__/graphics/technology/space-construction.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "drydock-assembly",
			},
			{
				type = "unlock-recipe",
				recipe = "drydock-structural",
			},
		},
		prerequisites = { "space-assembly" },
		unit = {
			count = 12000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-c",
	},
	{
		type = "technology",
		name = "space-casings",
		icon = "__SpaceModFeoras__/graphics/technology/space-casings.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "hull-component",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 12000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-d",
	},
	{
		type = "technology",
		name = "protection-fields",
		icon = "__SpaceModFeoras__/graphics/technology/protection-fields.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "protection-field",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 12000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-e",
	},
	{
		type = "technology",
		name = "fusion-reactor",
		icon = "__SpaceModFeoras__/graphics/technology/fusion-reactor.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "fusion-reactor",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 12000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-f",
	},
	{
		type = "technology",
		name = "space-thrusters",
		icon = "__SpaceModFeoras__/graphics/technology/space-thrusters.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "space-thruster",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 6000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-g",
	},
	{
		type = "technology",
		name = "fuel-cells",
		icon = "__SpaceModFeoras__/graphics/technology/fuel-cells.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "fuel-cell",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 6000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-h",
	},
	{
		type = "technology",
		name = "habitation",
		icon = "__SpaceModFeoras__/graphics/technology/habitation.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "habitation",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 12000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-i",
	},
	{
		type = "technology",
		name = "life-support-systems",
		icon = "__SpaceModFeoras__/graphics/technology/life-support.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "life-support",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 12000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-j",
	},
	{
		type = "technology",
		name = "astrometrics",
		icon = "__SpaceModFeoras__/graphics/technology/astrometrics.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "astrometrics",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 14000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-k",
	},
	{
		type = "technology",
		name = "spaceship-command",
		icon = "__SpaceModFeoras__/graphics/technology/command.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "command",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 24000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-l",
	},
	{
		type = "technology",
		name = "laser-cannon",
		icon = "__SpaceModFeoras__/graphics/technology/spacex-laser-cannon.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "laser-cannon",
			},
		},
		prerequisites = { "space-construction" },
		unit = {
			count = 24000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "military-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-m",
	},
	{
		type = "technology",
		name = "ftl-theory-A",
		icon = "__SpaceModFeoras__/graphics/technology/ftl.png",
		icon_size = 128,
		prerequisites = { "space-construction" },
		unit = {
			count = 25000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-n",
	},
	{
		type = "technology",
		name = "ftl-theory-B",
		icon = "__SpaceModFeoras__/graphics/technology/ftl.png",
		icon_size = 128,
		prerequisites = { "ftl-theory-A" },
		unit = {
			count = 50000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-o",
	},
	{
		type = "technology",
		name = "ftl-theory-C",
		icon = "__SpaceModFeoras__/graphics/technology/ftl.png",
		icon_size = 128,
		prerequisites = { "ftl-theory-B" },
		unit = {
			count = 100000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-p",
	},
	{
		type = "technology",
		name = "ftl-theory-D1",
		icon = "__SpaceModFeoras__/graphics/technology/ftl.png",
		icon_size = 128,
		prerequisites = { "ftl-theory-C" },
		unit = {
			count = 150000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-p",
	},
	{
		type = "technology",
		name = "ftl-theory-D2",
		icon = "__SpaceModFeoras__/graphics/technology/ftl.png",
		icon_size = 128,
		prerequisites = { "ftl-theory-C" },
		unit = {
			count = 150000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-p",
	},
	{
		type = "technology",
		name = "ftl-propulsion",
		icon = "__SpaceModFeoras__/graphics/technology/ftl.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "ftl-drive",
			},
		},
		prerequisites = { "ftl-theory-D1", "ftl-theory-D2" },
		unit = {
			count = 200000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "space-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-q",
	},
	{
		type = "technology",
		name = "exploration-satellite",
		icon = "__SpaceModFeoras__/graphics/technology/spacex-exploration-satellite.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "exploration-satellite",
			},
		},
		prerequisites = { "ftl-propulsion" },
		unit = {
			count = 250000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "space-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-r",
	},
	{
		type = "technology",
		name = "space-ai-robots",
		icon = "__SpaceModFeoras__/graphics/technology/spacex-space-ai-robots.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "space-ai-robot",
			},
		},
		prerequisites = { "ftl-propulsion" },
		unit = {
			count = 250000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "space-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-s",
	},
	{
		type = "technology",
		name = "space-fluid-tanks",
		icon = "__SpaceModFeoras__/graphics/technology/spacex-space-fluid-tanks.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "space-water-tank",
			},
			{
				type = "unlock-recipe",
				recipe = "space-oxygen-tank",
			},
			{
				type = "unlock-recipe",
				recipe = "space-fuel-tank",
			},
			{
				type = "unlock-recipe",
				recipe = "space-oxygen-barrel",
			},
		},
		prerequisites = { "ftl-propulsion" },
		unit = {
			count = 250000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "space-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-t",
	},
	{
		type = "technology",
		name = "space-cartography",
		icon = "__SpaceModFeoras__/graphics/technology/spacex-space-cartography.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "space-map",
			},
		},
		prerequisites = { "exploration-satellite" },
		unit = {
			count = 300000 * researchCost / marathon_adj,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "space-science-pack", 1 },
			},
			time = 60,
		},
		order = "k-v",
	},
})

local noSpace = settings.startup["SpaceX-no-space-sci"].value
if noSpace then
	local techs_with_space_science = { "ftl-propulsion", "exploration-satellite", "space-ai-robots", "space-fluid-tanks", "space-cartography" }
	for _, tech in pairs(techs_with_space_science) do
		local fix = data.raw.technology[tech]
		fix.unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
		}
	end
end

local combinatorSplit = settings.startup["SpaceX-split-combinator"].value
if combinatorSplit then
	local fix = data.raw.technology["space-assembly"]
	fix.effects = {
		{
			type = "unlock-recipe",
			recipe = "assembly-robot",
		},
		{
			type = "unlock-recipe",
			recipe = "spacex-combinator",
		},
		{
			type = "unlock-recipe",
			recipe = "spacex-combinator-stage",
		},
	}
end
