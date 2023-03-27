local productionCost = settings.startup["SpaceX-production"].value or 1
local classicMode = settings.startup["SpaceX-classic-mode"].value or false

local SpaceXRecipes = {
	"assembly-robot",
	"drydock-assembly",
	"drydock-structural",
	"fusion-reactor",
	"hull-component",
	"protection-field",
	"space-thruster",
	"fuel-cell",
	"habitation",
	"life-support",
	"command",
	"laser-cannon",
	"astrometrics",
	"ftl-drive",
	"spacex-combinator",
	"spacex-combinator-stage",
	"exploration-satellite",
	"space-ai-robot",
	"space-ai-robot-frame",
	"space-water-tank",
	"space-fuel-tank",
	"space-oxygen-tank",
	"space-oxygen-barrel",
	"space-map",
}

for _, r in pairs(SpaceXRecipes) do
	local recipe = data.raw["recipe"][r]
	if recipe then
		recipe.category = "research"
	end
end

local function replace_ingredient(ingredients, old, new, new_amount)
	local amount = 0
	for i, ingredient in pairs(ingredients) do
		if ingredient[1] == old or ingredient.name == old then
			amount = ingredient[2] or ingredient.amount
			table.remove(ingredients, i)
			break
		end
	end
	if new_amount then
		table.insert(ingredients, { new, new_amount })
	elseif amount ~= 0 then
		table.insert(ingredients, { new, amount })
	end
end

local function replace(recipe_name, old, new, new_amount)
	local recipe = data.raw["recipe"][recipe_name]

	if recipe then
		if recipe.ingredients then
			replace_ingredient(recipe.ingredients, old, new, new_amount)
		end
		if recipe.normal and recipe.normal.ingredients then
			replace_ingredient(recipe.normal.ingredients, old, new, new_amount)
		end
		if recipe.expensive and recipe.expensive.ingredients then
			replace_ingredient(recipe.expensive.ingredients, old, new, new_amount)
		end
	end
end

replace("assembly-robot", "construction-robot", "construction-robot-ht")
replace("assembly-robot", "py-construction-robot-01", "construction-robot-ht")

replace("drydock-assembly", "roboport", "py-roboport-mk03")
replace("drydock-assembly", "py-roboport-mk01", "py-roboport-mk03")
replace("drydock-assembly", "solar-panel", "solar-panel-mk04")
replace("drydock-assembly", "solar-panel-mk01", "solar-panel-mk04")

table.insert(data.raw["recipe"]["fusion-reactor"].ingredients, { "personal-fusion-cell", 50 * productionCost })
table.insert(data.raw["recipe"]["fusion-reactor"].ingredients, { "fusion-reactor-mk02", 10 * productionCost })

replace("hull-component", "steel-plate", "titanium-plate")
table.insert(data.raw["recipe"]["hull-component"].ingredients, { "reinforced-wall-shield", 50 * productionCost })

table.insert(data.raw["recipe"]["protection-field"].ingredients, { "accumulator-mk03", 50 * productionCost })

replace("space-thruster", "pipe", "ht-pipes")
replace("space-thruster", "electric-engine-unit", "sc-engine")

replace("fuel-cell", "pipe", "ht-pipes")
replace("fuel-cell", "nuclear-reactor", "nuclear-reactor-mk04")
replace("fuel-cell", "steel-plate", "titanium-plate")

replace("habitation", "steel-plate", "titanium-plate")
table.insert(data.raw["recipe"]["habitation"].ingredients, { "fes", 50 * productionCost })

replace("life-support", "pipe", "ht-pipes")

table.insert(data.raw["recipe"]["command"].ingredients, { "fes", 50 * productionCost })

replace("astrometrics", "lab", "research-center-mk04")

if not classicMode then
	replace("space-ai-robot-frame", "construction-robot", "construction-robot-ht")
	replace("space-ai-robot-frame", "py-construction-robot-01", "construction-robot-ht")
	replace("space-ai-robot-frame", "logistic-robot", "logistic-robot-ht")
	replace("space-ai-robot-frame", "py-logistic-robot-01", "logistic-robot-ht")

	replace("space-ai-robot", "battery-mk2-equipment", "quantum-battery")
	replace("space-ai-robot", "radar", "megadar")
	table.insert(data.raw["recipe"]["space-ai-robot"].ingredients, { "xeno-codex-mk04", 10 * productionCost })
	table.insert(
		data.raw["recipe"]["space-ai-robot"].ingredients,
		{ "quantum-computer", math.ceil(1 * productionCost) }
	)

	replace("space-water-tank", "storage-tank", "py-tank-10000")
	replace("space-water-tank", "pipe", "ht-pipes")

	replace("space-fuel-tank", "storage-tank", "py-tank-10000")
	replace("space-fuel-tank", "pipe", "ht-pipes")

	replace("space-oxygen-tank", "storage-tank", "py-tank-10000")
	replace("space-oxygen-tank", "pipe", "ht-pipes")

	table.insert(
		data.raw["recipe"]["space-oxygen-barrel"].ingredients,
		{ type = "fluid", name = "oxygen", amount = 5000 * productionCost }
	)
end
