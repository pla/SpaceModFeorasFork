local classicMode = settings.startup["SpaceX-classic-mode"].value or false
local noSpace = settings.startup["SpaceX-no-space-sci"].value or false

if not noSpace then
	local ftl = data.raw.technology["ftl-propulsion"]
	ftl.unit.ingredients = {
		{ "production-science-pack", 1 },
		{ "utility-science-pack", 1 },
		{ "space-science-pack", 1 },
		{ "matter-tech-card", 1 },
		{ "advanced-tech-card", 1 },
		{ "singularity-tech-card", 1 },
	}
	ftl.unit.count = ftl.unit.count / 2
end

if not classicMode then
	if not noSpace then
		local sc = data.raw.technology["space-cartography"]
		sc.unit.ingredients = {
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "matter-tech-card", 1 },
			{ "advanced-tech-card", 1 },
			{ "singularity-tech-card", 1 },
		}
		sc.unit.count = sc.unit.count / 2
	end
end
