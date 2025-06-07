extends Node
class_name TraitData

const TRAITS = {
	"Rich": {
		"cash_bonus": 1000,
		"description": "Starts with lots of money"
	},
	"High": {
		"speed_multiplyer": 0.8,
		"thought_multiplyer": 0.8,
		"mood_additive": 1.5,
		"description": "moves slower, acts slower, happier"
	},
	"Slow": {
		"speed_multiplyer": 0.75
	},
	"Uppers": {
		"speed_multiplyer": 1.2
	},
	"Anxious" : {
		"speed_multiplyer": 1.1,
		"thought_multiplyer": 0.9
	},
	"Elderly": {
		"speed_multiplyer": 0.8,
		"thought_multiplyer": 0.9,
		"cash_bonus": 250
	}
}
