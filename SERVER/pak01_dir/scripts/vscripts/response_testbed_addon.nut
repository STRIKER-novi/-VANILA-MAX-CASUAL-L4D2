local SafeDoorConcept = ["concept", "NesciusSaferoomDoor"];
local rules = [
    {
        name = "louis_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "Manager"]
        ],
        responses = [
            { scenename = "scenes/Manager/PositiveNoise03.vcd" } //woooo
            { scenename = "scenes/Manager/PlayerTransitionClose04.vcd" } //boom dya
            { scenename = "scenes/Manager/Taunt08.vcd" } // evil laugh
            { scenename = "scenes/Manager/ReactionPositive06.vcd"} //heh heehheh
        ]
        group_params = RGroupParams()
    }
    {
        name = "bill_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "NamVet"]
        ],
        responses = [
            { scenename = "scenes/NamVet/Taunt07.vcd" } //evil laugh

        ]
        group_params = RGroupParams()
    }
    {
        name = "zoey_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "TeenGirl"]
        ],
        responses = [
            { scenename = "scenes/TeenGirl/Taunt39.vcd" } //yeahh!

        ]
        group_params = RGroupParams()
    }
    {
        name = "francis_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "Biker"]
        ],
        responses = [
            { scenename = "scenes/Biker/Taunt02.vcd" } //HELH YEAH
            { scenename = "scenes/Biker/Taunt04.vcd" } //OH YEA
            { scenename = "scenes/Biker/Taunt05.vcd" } // evil laugh
        ]
        group_params = RGroupParams()
    }
    {
        name = "nick_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "Gambler"]
        ],
        responses = [
            { scenename = "scenes/Gambler/BattleCry03.vcd" } //suck on this
            { scenename = "scenes/Gambler/BattleCry04.vcd" } //yeah die!
        ]
        group_params = RGroupParams()
    }
    {
        name = "coach_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "Coach"]
        ],
        responses = [
            { scenename = "scenes/Coach/BattleCry01.vcd" }
            { scenename = "scenes/Coach/BattleCry04.vcd" }
            { scenename = "scenes/Coach/BattleCry08.vcd" }
            { scenename = "scenes/Coach/BattleCry09.vcd" }
        ]
        group_params = RGroupParams()
    }
    {
        name = "rochelle_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "Producer"]
        ],
        responses = [
            { scenename = "scenes/Producer/BattleCry01.vcd" }
            { scenename = "scenes/Producer/BattleCry02.vcd" }
        ]
        group_params = RGroupParams()
    }
    {
        name = "ellis_violent_door_open",
        criteria = [
            SafeDoorConcept,
            ["who", "Mechanic"]
        ],
        responses = [
            { scenename = "scenes/Mechanic/BattleCry01.vcd" }
            { scenename = "scenes/Mechanic/BattleCry03.vcd" }
        ]
        group_params = RGroupParams()
    }
]

rr_ProcessRules(rules);
