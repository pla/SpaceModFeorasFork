local productionCost = settings.startup["SpaceX-production"].value or 1

data:extend({
	{
		type = "recipe",
		name = "assembly-robot",
		enabled = false,
		energy_required = 10,
		ingredients = {
			{ "construction-robot", 5 },
			{ "speed-module-3", 1 },
			{ "effectivity-module-3", 1 },
			{ "low-density-structure", 5 },
		},
		result = "assembly-robot",
	},
	{
		type = "recipe",
		name = "drydock-assembly",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "assembly-robot", 50 * productionCost },
			{ "roboport", 10 * productionCost },
			{ "processing-unit", 200 * productionCost },
			{ "solar-panel", 200 * productionCost },
			{ "low-density-structure", 100 * productionCost },
		},
		result = "drydock-assembly",
	},
	{
		type = "recipe",
		name = "drydock-structural",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "low-density-structure", 200 * productionCost },
		},
		result = "drydock-structural",
	},
	{
		type = "recipe",
		name = "fusion-reactor",
		enabled = false,
		energy_required = 100,
		ingredients = {
			{ "fusion-reactor-equipment", 100 * productionCost },
		},
		result = "fusion-reactor",
	},
	{
		type = "recipe",
		name = "hull-component",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "low-density-structure", 250 * productionCost },
			{ "steel-plate", 100 * productionCost },
		},
		result = "hull-component",
	},
	{
		type = "recipe",
		name = "protection-field",
		enabled = false,
		energy_required = 100,
		ingredients = {
			{ "energy-shield-mk2-equipment", 100 * productionCost },
		},
		result = "protection-field",
	},
	{
		type = "recipe",
		name = "space-thruster",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "speed-module-3", 50 * productionCost },
			{ "pipe", 100 * productionCost },
			{ "processing-unit", 100 * productionCost },
			{ "electric-engine-unit", 100 * productionCost },
			{ "low-density-structure", 100 * productionCost },
		},
		result = "space-thruster",
	},
	{
		type = "recipe",
		name = "fuel-cell",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "steel-plate", 100 * productionCost },
			{ "processing-unit", 100 * productionCost },
			{ "low-density-structure", 100 * productionCost },
			{ "nuclear-reactor", 1 * productionCost },
		},
		result = "fuel-cell",
	},
	{
		type = "recipe",
		name = "habitation",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "steel-plate", 100 * productionCost },
			{ "plastic-bar", 500 * productionCost },
			{ "processing-unit", 100 * productionCost },
			{ "low-density-structure", 100 * productionCost },
		},
		result = "habitation",
	},
	{
		type = "recipe",
		name = "life-support",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "productivity-module-3", 50 * productionCost },
			{ "pipe", 200 * productionCost },
			{ "processing-unit", 100 * productionCost },
			{ "low-density-structure", 100 * productionCost },
		},
		result = "life-support",
	},
	{
		type = "recipe",
		name = "command",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "speed-module-3", 50 * productionCost },
			{ "effectivity-module-3", 50 * productionCost },
			{ "productivity-module-3", 50 * productionCost },
			{ "plastic-bar", 200 * productionCost },
			{ "processing-unit", 100 * productionCost },
			{ "low-density-structure", 100 * productionCost },
		},
		result = "command",
	},
	{
		type = "recipe",
		name = "laser-cannon",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "arithmetic-combinator", 50 * productionCost },
			{ "decider-combinator", 50 * productionCost },
			{ "laser-turret", 100 * productionCost },
			{ "low-density-structure", 50 * productionCost },
			{ "processing-unit", 50 * productionCost },
		},
		result = "laser-cannon",
	},
	{
		type = "recipe",
		name = "astrometrics",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "speed-module-3", 50 * productionCost },
			{ "processing-unit", 300 * productionCost },
			{ "low-density-structure", 100 * productionCost },
			{ "lab", 100 * productionCost },
		},
		result = "astrometrics",
	},
	{
		type = "recipe",
		name = "ftl-drive",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "productivity-module-3", 500 * productionCost },
			{ "speed-module-3", 500 * productionCost },
			{ "effectivity-module-3", 500 * productionCost },
			{ "low-density-structure", 100 * productionCost },
			{ "processing-unit", 500 * productionCost },
		},
		result = "ftl-drive",
	},
	{
		type = "recipe",
		name = "spacex-combinator",
		enabled = false,
		energy_required = 5,
		ingredients = {
			{ "copper-cable", 5 },
			{ "electronic-circuit", 5 },
			{ "advanced-circuit", 1 },
		},
		result = "spacex-combinator",
	},
	{
		type = "recipe",
		name = "spacex-combinator-stage",
		enabled = false,
		energy_required = 5,
		ingredients = {
			{ "copper-cable", 5 },
			{ "electronic-circuit", 5 },
			{ "advanced-circuit", 1 },
		},
		result = "spacex-combinator-stage",
	},
	{
		type = "recipe",
		name = "exploration-satellite",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "satellite", 5 },
			{ "space-thruster", 1 },
			{ "nuclear-fuel", 10 },
		},
		result = "exploration-satellite",
	},
	{
		type = "recipe",
		name = "space-ai-robot",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "exoskeleton-equipment", 50 },
			{ "belt-immunity-equipment", 50 },
			{ "radar", 50 },
			{ "rocket-control-unit", 100 },
			{ "battery-mk2-equipment", 20 },
			{ "power-armor-mk2", 5 },
			{ "fusion-reactor-equipment", 10 },
		},
		result = "space-ai-robot",
	},
	{
		type = "recipe",
		name = "space-water-tank",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "water-barrel", 2000 },
			{ "pump", 100 },
			{ "storage-tank", 100 },
			{ "pipe", 500 },
		},
		result = "space-water-tank",
	},
	{
		type = "recipe",
		name = "space-fuel-tank",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "nuclear-fuel", 500 },
			{ "pump", 100 },
			{ "storage-tank", 100 },
			{ "pipe", 500 },
		},
		result = "space-fuel-tank",
	},
	{
		type = "recipe",
		name = "space-oxygen-tank",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "space-oxygen-barrel", 2000 },
			{ "pump", 100 },
			{ "storage-tank", 100 },
			{ "pipe", 500 },
		},
		result = "space-oxygen-tank",
	},
	{
		type = "recipe",
		name = "space-oxygen-barrel",
		enabled = false,
		energy_required = 0.2,
		ingredients = {
			{ "empty-barrel", 1 },
		},
		result = "space-oxygen-barrel",
	},
	{
		type = "recipe",
		name = "space-map",
		enabled = false,
		energy_required = 50,
		ingredients = {
			{ "exploration-data-disk", 20 },
		},
		result = "space-map",
	},
})

local cheapFusion = settings.startup["SpaceX-cheaper-fusion-reactor"].value
if cheapFusion then
	local fix = data.raw.recipe["fusion-reactor"]
	fix.ingredients = {
		{ "fusion-reactor-equipment", 40 * productionCost },
	}
end

local replaceNuclear = settings.startup["SpaceX-no-nuclear"].value
if replaceNuclear then
	for _, tech in pairs({"exploration-satellite", "space-fuel-tank"}) do
		for _, ingridient in pairs(data.raw["recipe"][tech].ingredients) do
			if ingridient[1] == "nuclear-fuel" then
				ingridient[1] = "rocket-fuel"
			end
		end
	end
	for _, ingridient in pairs(data.raw["recipe"]["fuel-cell"].ingredients) do
		if ingridient[1] == "nuclear-reactor" then
			ingridient[1] = "rocket-fuel"
			ingridient[2] = 500 * productionCost
		end
	end
end