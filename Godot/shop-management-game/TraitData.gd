extends Node

const TRAIT_DATA = {
	"Rich": {
		"description": "Starts with lots of money",
		"shared_traits": {},
		"customer_traits": {
			"cash_bonus": 1000
		},
		"employee_traits" : {}
	},
	"High": {
		"description": "moves slower, acts slower, happier",
		"shared_traits": {
			"speed_multiplyer": 0.8,
			"thought_multiplyer": 0.8,
			"mood_additive": 1.5
		},
		"customer_traits" : {},
		"employee_traits" : {}
	},
	"Uppers": {
		"shared_traits": {
			"speed_multiplyer": 1.2
		},
		"customer_traits": {},
		"employee_traits": {}
		
	},
	"Anxious" : {
		"shared_traits": {
			"speed_multiplyer": 1.1,
			"thought_multiplyer": 0.9
		},
		"customer_traits": {},
		"employee_traits": {}
		
	},
	"Elderly": {
		"shared_traits": {
			"speed_multiplyer": 0.8,
			"thought_multiplyer": 0.9,
		},
		"customer_traits": {
			"cash_bonus": 250
		},
		"employee_traits": {}
	}
}

var TRAIT_LIST: Array = TRAIT_DATA.keys()
