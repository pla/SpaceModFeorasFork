if settings.startup["SpaceX-no-bob"].value == false then
	if
		mods["boblibrary"]
		and mods["bobplates"]
		and mods["bobmodules"]
		and mods["bobelectronics"]
		and mods["boblogistics"]
		and mods["bobtech"]
		and mods["bobequipment"]
		and data.raw.recipe["advanced-processing-unit"]
	then
		require("__SpaceModFeorasFork__/prototypes/recipe-bobs")
		require("__SpaceModFeorasFork__/prototypes/technology-bobs")
	end
end

if mods["IndustrialRevolution"] or mods["IndustrialRevolution3"] then
	for _, tech in pairs({ "space-ai-robots", "space-fluid-tanks", "exploration-satellite" }) do
		data.raw.technology[tech].unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
		}
	end
end
