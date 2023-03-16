local bob_coefficient = 1
local researchCost = settings.startup["SpaceX-research"].value or 1
local classicMode = settings.startup["SpaceX-classic-mode"].value or false

local SpaceXTechs = {
	"space-assembly",
	"space-construction",
	"space-casings",
	"protection-fields",
	"fusion-reactor",
	"space-thrusters",
	"fuel-cells",
	"habitation",
	"life-support-systems",
	"spaceship-command",
	"laser-cannon",
	"astrometrics",
	"ftl-theory-A",
	"ftl-theory-B",
	"ftl-theory-C",
	"ftl-theory-D1",
	"ftl-theory-D2",
	"ftl-propulsion",
	"exploration-satellite",
	"space-ai-robots",
	"space-fluid-tanks",
	"space-cartography",
}

if data.raw.tool["advanced-logistic-science-pack"] then
	table.insert(SpaceXTechs, "ftl-theory-D")

	data:extend({
		{
			type = "technology",
			name = "ftl-theory-D",
			icon = "__SpaceModFeoras__/graphics/technology/ftl.png",
			icon_size = 128,
			prerequisites = { "ftl-theory-C" },
			unit = {
				count = 150000 * researchCost,
				ingredients = {
					{ "automation-science-pack", 1 },
					{ "logistic-science-pack", 1 },
					{ "chemical-science-pack", 1 },
					{ "advanced-logistic-science-pack", 1 },
				},
				time = 60,
			},
			order = "k-o-a",
		},
	})

	bobmods.lib.tech.add_science_pack("space-assembly", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("space-construction", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("space-casings", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("protection-fields", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("fusion-reactor", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("space-thrusters", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("fuel-cells", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("habitation", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("life-support-systems", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("spaceship-command", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("laser-cannon", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("astrometrics", "advanced-logistic-science-pack", 1)
	bobmods.lib.tech.add_science_pack("ftl-propulsion", "advanced-logistic-science-pack", 1)
	if not classicMode then
		bobmods.lib.tech.add_science_pack("exploration-satellite", "advanced-logistic-science-pack", 1)
		bobmods.lib.tech.add_science_pack("space-ai-robots", "advanced-logistic-science-pack", 1)
		bobmods.lib.tech.add_science_pack("space-fluid-tanks", "advanced-logistic-science-pack", 1)
		bobmods.lib.tech.add_science_pack("space-cartography", "advanced-logistic-science-pack", 1)
	end

	if not classicMode then
		data.raw.technology["ftl-theory-A"].unit.count = 25000 * researchCost
		data.raw.technology["ftl-theory-B"].unit.count = 50000 * researchCost
		data.raw.technology["ftl-theory-C"].unit.count = 100000 * researchCost
		data.raw.technology["ftl-theory-D1"].unit.count = 150000 * researchCost
		data.raw.technology["ftl-theory-D2"].unit.count = 150000 * researchCost
		data.raw.technology["ftl-propulsion"].unit.count = 200000 * researchCost
		data.raw.technology["exploration-satellite"].unit.count = 250000 * researchCost
		data.raw.technology["space-ai-robots"].unit.count = 250000 * researchCost
		data.raw.technology["space-fluid-tanks"].unit.count = 250000 * researchCost
		data.raw.technology["space-cartography"].unit.count = 300000 * researchCost
	else
		for _, tech in pairs({"ftl-theory-A", "ftl-theory-B", "ftl-theory-C", "ftl-theory-D1", "ftl-theory-D2", "ftl-propulsion"}) do
			local rootTech = data.raw.technology[tech]
			if rootTech ~=nil then
				rootTech.unit.count = 200000 * researchCost
			end
		end
	end

	bobmods.lib.tech.replace_prerequisite("ftl-theory-D1", "ftl-theory-C", "ftl-theory-D")
	bobmods.lib.tech.replace_prerequisite("ftl-theory-D2", "ftl-theory-C", "ftl-theory-D")
end

bobmods.lib.tech.add_prerequisite("space-assembly", "bob-robots-3")

if bobmods.modules.EnableGodModules == true then
	bobmods.lib.tech.add_prerequisite("space-assembly", "god-module-5")
else
	bobmods.lib.tech.add_prerequisite("space-assembly", "speed-module-8")
	bobmods.lib.tech.add_prerequisite("space-assembly", "effectivity-module-8")
	bobmods.lib.tech.add_prerequisite("ftl-propulsion", "productivity-module-8")
end

bobmods.lib.tech.add_prerequisite("drydock-assembly", "advanced-electronics-3")
bobmods.lib.tech.add_prerequisite("astrometrics", "advanced-research")
bobmods.lib.tech.add_prerequisite("space-construction", "bob-robo-modular-4")
bobmods.lib.tech.add_prerequisite("protection-fields", "bob-energy-shield-equipment-6")
bobmods.lib.tech.add_prerequisite("fusion-reactor", "fusion-reactor-equipment-4")
bobmods.lib.tech.add_prerequisite("low-density-structure", "titanium-processing")
bobmods.lib.tech.add_prerequisite("low-density-structure", "nitinol-processing")

bobmods.lib.tech.add_prerequisite("rocket-silo", "titanium-processing")
bobmods.lib.tech.add_prerequisite("rocket-silo", "nitinol-processing")
bobmods.lib.tech.add_prerequisite("rocket-silo", "bob-electric-energy-accumulators-4")
bobmods.lib.tech.add_prerequisite("rocket-silo", "bob-solar-energy-4")
bobmods.lib.tech.add_prerequisite("rocket-silo", "advanced-electronics-3")

bobmods.lib.tech.add_prerequisite("laser-cannon", "personal-laser-defense-equipment-6")

if not classicMode then
	bobmods.lib.tech.add_prerequisite("space-fluid-tanks", "bob-fluid-handling-4")

	bobmods.lib.tech.add_prerequisite("space-ai-robots", "bob-robots-4")
	bobmods.lib.tech.add_prerequisite("space-ai-robots", "exoskeleton-equipment-3")
	bobmods.lib.tech.add_prerequisite("space-ai-robots", "bob-battery-equipment-6")
end

-- alternate protection field recipe enabler
bobmods.lib.tech.add_recipe_unlock("protection-fields", "protection-field-goopless")

-- Nerf Bob's end game
for i, tech in pairs(SpaceXTechs) do
	local rootTech = data.raw.technology[tech]
	if rootTech ~= nil then
		rootTech.unit.count = rootTech.unit.count * bob_coefficient
	end
end
