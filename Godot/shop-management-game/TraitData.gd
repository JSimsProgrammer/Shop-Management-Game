extends Node

const TRAIT_DATA = {
	"Rich": {
		"description": "Starts with lots of money",
		"shared_mods": {},
		"customer_mods": {
			"other": {
				"cash_bonus_range": [500, 2000]
			}
		},
		"employee_mods" : {}
	},
	"High": {
		"description": "moves slower, acts slower, happier",
		"shared_mods": {
			"additives": {
				"mood": 15
			},
			"multipliers": {
				"speed": 0.8,
				"thought": 0.9
			}
		},
		"customer_mods" : {},
		"employee_mods" : {}
	},
	"Uppers": {
		"shared_mods": {
			"multipliers": {
				"speed": 1.2
			}
		},
		"customer_mods": {},
		"employee_mods": {}
		
	},
	"Anxious" : {
		"shared_mods": {
			"multipliers": {
				"speed": 1.1,
				"thought": 0.9
			}
		},
		"customer_mods": {},
		"employee_mods": {}
		
	},
	"Elderly": {
		"shared_mods": {
			"multipliers": {
				"speed": 0.8,
				"thought": 0.9
			}
		},
		"customer_mods": {
			"other": {
				"cash_bonus_range": [250, 500]
			}
		},
		"employee_mods": {}
	}
}

var TRAIT_LIST: Array = TRAIT_DATA.keys()
