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
