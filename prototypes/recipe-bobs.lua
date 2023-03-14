if not bobmods.modules then
	bobmods.modules = {}
end

local productionCost = settings.startup["SpaceX-production"].value or 1

data:extend({
	{
		type = "recipe",
		name = "protection-field-goopless",
		enabled = false,
		energy_required = 100,
		ingredients = {
			{ "energy-shield-mk3-equipment", 1000 * productionCost },
			{ "advanced-processing-unit", 3500 * productionCost },
			{ "effectivity-module-4", 400 * productionCost },
			{ "productivity-module-4", 400 * productionCost },
			{ "effectivity-module-6", 200 * productionCost },
			{ "productivity-module-6", 200 * productionCost },
			{ "effectivity-module-8", 100 * productionCost },
			{ "productivity-module-8", 100 * productionCost },
		},
		result = "protection-field",
	},
})

if bobmods.modules.EnableGodModules == true then
	-- assembly-robot
	bobmods.lib.recipe.replace_ingredient("assembly-robot", "speed-module-3", "god-module-5")
	bobmods.lib.recipe.replace_ingredient("assembly-robot", "effectivity-module-3", "god-module-5")
	-- space-thruster
	bobmods.lib.recipe.replace_ingredient("space-thruster", "speed-module-3", "god-module-5")

	-- life-support
	bobmods.lib.recipe.replace_ingredient("life-support", "productivity-module-3", "god-module-5")
	-- command
	bobmods.lib.recipe.replace_ingredient("command", "speed-module-3", "god-module-5")
	bobmods.lib.recipe.replace_ingredient("command", "effectivity-module-3", "god-module-5")
	bobmods.lib.recipe.replace_ingredient("command", "productivity-module-3", "god-module-5")
	-- astrometrics
	bobmods.lib.recipe.replace_ingredient("astrometrics", "speed-module-3", "god-module-5")
	-- ftl-drive
	bobmods.lib.recipe.replace_ingredient("ftl-drive", "speed-module-3", "god-module-5")
	bobmods.lib.recipe.replace_ingredient("ftl-drive", "effectivity-module-3", "god-module-5")
	bobmods.lib.recipe.replace_ingredient("ftl-drive", "productivity-module-3", "god-module-5")
else
	-- assembly-robot
	bobmods.lib.recipe.replace_ingredient("assembly-robot", "speed-module-3", "speed-module-8")
	bobmods.lib.recipe.replace_ingredient("assembly-robot", "effectivity-module-3", "effectivity-module-8")
	-- space-thruster
	bobmods.lib.recipe.replace_ingredient("space-thruster", "speed-module-3", "speed-module-8")
	-- life-support
	bobmods.lib.recipe.replace_ingredient("life-support", "productivity-module-3", "productivity-module-8")
	-- command
	bobmods.lib.recipe.replace_ingredient("command", "speed-module-3", "speed-module-8")
	bobmods.lib.recipe.replace_ingredient("command", "effectivity-module-3", "effectivity-module-8")
	bobmods.lib.recipe.replace_ingredient("command", "productivity-module-3", "productivity-module-8")
	-- astrometrics
	bobmods.lib.recipe.replace_ingredient("astrometrics", "speed-module-3", "speed-module-8")
	-- ftl-drive
	bobmods.lib.recipe.replace_ingredient("ftl-drive", "speed-module-3", "speed-module-8")
	bobmods.lib.recipe.replace_ingredient("ftl-drive", "effectivity-module-3", "effectivity-module-8")
	bobmods.lib.recipe.replace_ingredient("ftl-drive", "productivity-module-3", "productivity-module-8")
end
-- assembly-robot
bobmods.lib.recipe.replace_ingredient("assembly-robot", "construction-robot", "bob-construction-robot-4")
-- space-thruster
bobmods.lib.recipe.replace_ingredient("space-thruster", "pipe", "titanium-pipe")
bobmods.lib.recipe.replace_ingredient("space-thruster", "processing-unit", "advanced-processing-unit")
-- life-support
bobmods.lib.recipe.replace_ingredient("life-support", "pipe", "titanium-pipe")
bobmods.lib.recipe.replace_ingredient("life-support", "processing-unit", "advanced-processing-unit")
-- command
bobmods.lib.recipe.replace_ingredient("command", "processing-unit", "advanced-processing-unit")
-- astrometrics
bobmods.lib.recipe.replace_ingredient("astrometrics", "processing-unit", "advanced-processing-unit")
bobmods.lib.recipe.replace_ingredient("astrometrics", "lab", "lab-2")
-- ftl-drive
bobmods.lib.recipe.replace_ingredient("ftl-drive", "processing-unit", "advanced-processing-unit")
-- drydock-assembly
bobmods.lib.recipe.replace_ingredient("drydock-assembly", "solar-panel", "solar-panel-large-3")
bobmods.lib.recipe.replace_ingredient("drydock-assembly", "processing-unit", "advanced-processing-unit")
if settings.startup["bobmods-logistics-disableroboports"].value then
	bobmods.lib.recipe.replace_ingredient("drydock-assembly", "roboport", "personal-roboport-mk4-equipment")
else
	bobmods.lib.recipe.replace_ingredient("drydock-assembly", "roboport", "bob-roboport-4")
end
-- fusion-reactor
bobmods.lib.recipe.replace_ingredient("fusion-reactor", "fusion-reactor-equipment", "fusion-reactor-equipment-4")
-- hull-component
bobmods.lib.recipe.replace_ingredient("hull-component", "steel-plate", "titanium-plate")
-- protection-field
bobmods.lib.recipe.replace_ingredient("protection-field", "energy-shield-mk2-equipment", "energy-shield-mk6-equipment")
-- fuel-cell
bobmods.lib.recipe.replace_ingredient("fuel-cell", "steel-plate", "titanium-plate")
bobmods.lib.recipe.replace_ingredient("fuel-cell", "processing-unit", "advanced-processing-unit")
-- habitation
bobmods.lib.recipe.replace_ingredient("habitation", "steel-plate", "titanium-plate")
bobmods.lib.recipe.replace_ingredient("habitation", "processing-unit", "advanced-processing-unit")
-- laser-cannon
data.raw.recipe["laser-cannon"].ingredients = {			
	{ "arithmetic-combinator", 50 * productionCost },
	{ "decider-combinator", 50 * productionCost },
	{ "personal-laser-defense-equipment-6", 100 * productionCost }, }
-- low-density-structure
bobmods.lib.recipe.replace_ingredient("low-density-structure", "steel-plate", "titanium-plate")
bobmods.lib.recipe.replace_ingredient("low-density-structure", "copper-plate", "nitinol-alloy")
-- satellite
bobmods.lib.recipe.replace_ingredient("satellite", "accumulator", "large-accumulator-3")
bobmods.lib.recipe.replace_ingredient("satellite", "solar-panel", "solar-panel-large-3")
bobmods.lib.recipe.replace_ingredient("satellite", "processing-unit", "advanced-processing-unit")
bobmods.lib.recipe.replace_ingredient("satellite", "radar", "radar-5")
-- space tanks
for _, tech in pairs({"space-fuel-tank", "space-water-tank", "space-oxygen-tank"}) do
	bobmods.lib.recipe.replace_ingredient(tech, "storage-tank", "storage-tank-4")
	bobmods.lib.recipe.replace_ingredient(tech, "pump", "bob-pump-4")
	bobmods.lib.recipe.replace_ingredient(tech, "pipe", "titanium-pipe")
end
-- space ai robot
bobmods.lib.recipe.replace_ingredient("space-ai-robot", "fusion-reactor-equipment", "fusion-reactor-equipment-4")
bobmods.lib.recipe.replace_ingredient("space-ai-robot", "exoskeleton-equipment", "exoskeleton-equipment-3")
bobmods.lib.recipe.replace_ingredient("space-ai-robot", "battery-mk2-equipment", "battery-mk6-equipment")
