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

if settings.startup["SpaceX-no-krastorio"].value == false then
	if mods["Krastorio2"] then
		require("__SpaceModFeorasFork__/prototypes/recipe-krastorio")
		require("__SpaceModFeorasFork__/prototypes/technology-krastorio")
	end
end

if settings.startup["SpaceX-no-pyanodons"].value == false then
	if
		mods["pyalienlife"]
		and mods["pyalternativeenergy"]
		and mods["pycoalprocessing"]
		and mods["pyfusionenergy"]
		and mods["pyhightech"]
		and mods["pyindustry"]
		and mods["pypetroleumhandling"]
		and mods["pyrawores"]
		and mods["pypostprocessing"]
	then
		require("__SpaceModFeorasFork__/prototypes/recipe-pyanodons")
		require("__SpaceModFeorasFork__/prototypes/technology-pyanodons")
	end
end
