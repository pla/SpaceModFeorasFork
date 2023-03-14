remote.add_interface("spacex-feoras", {
    milestones_preset_addons = function()
        return {
            ["Space Extension Feoras (SpaceX)"] = {
                required_mods = {"SpaceModFeoras"},
                forbidden_mods = {},
                milestones = {
                    {type="group", name="SpaceX"},
                    {type="item", name="satellite",            quantity=7},
                    {type="item", name="drydock-structural",   quantity=10},
                    {type="item", name="drydock-assembly",     quantity=2},
                    {type="item", name="protection-field",     quantity=1},
                    {type="item", name="fusion-reactor",       quantity=1},
                    {type="item", name="habitation",           quantity=1},
                    {type="item", name="life-support",         quantity=1},
                    {type="item", name="command",              quantity=1},
                    {type="item", name="laser-cannon",         quantity=2},
                    {type="item", name="fuel-cell",            quantity=2},
                    {type="item", name="space-thruster",       quantity=4},
                    {type="item", name="hull-component",       quantity=10},
                    {type="item", name="ftl-drive",            quantity=1},
                    {type="technology", name="ftl-theory-A",   quantity=1},
                    {type="technology", name="ftl-theory-B",   quantity=1},
                    {type="technology", name="ftl-theory-C",   quantity=1},
                    {type="technology", name="ftl-theory-D1",  quantity=1},
                    {type="technology", name="ftl-theory-D2",  quantity=1},
                    {type="technology", name="ftl-theory-E",   quantity=1},
                    {type="technology", name="ftl-propulsion", quantity=1},
                }
            }
        }
    end
})