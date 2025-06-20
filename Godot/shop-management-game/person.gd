extends Node2D

class_name Person

var char_name: String
var role: String
var traits: Array = []

@onready var info_label = $info_label
@onready var click_area = $click_area

var base_stats = {
	"speed": randf_range(95, 105),
	"mood": randf_range(95, 105),
	"thought": randf_range(95, 105)
}

var stats = {
	"speed": self.base_stats["speed"],
	"mood": self.base_stats["mood"],
	"thought": self.base_stats["thought"]
}

var stat_mods = {
	"speed": {
		"additives": [],
		"multipliers": []
	},
	"mood": {
		"additives": [],
		"multipliers": []
	},
	"thought": {
		"additives": [],
		"multipliers": []
	}
}

func _ready():
	update_label()
	click_area.connect("input_event", Callable(self, "_on_click_area_input"))

func update_label():
	info_label.text = char_name

func _on_click_area_input(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		CharacterWindow.showFor(self)  # Assumes CharacterWindow is an autoload singleton or reachable globally

func getStat(s: String):
	var additivesArray = stat_mods[s]["additives"]
	var multipliersArray = stat_mods[s]["multipliers"]
	var stat: float
	
	#Step 1: Start with Base
	stat = base_stats[s]
	#Step 2: Additives
	for plus in additivesArray:
		stat += plus
	#Step 3: Multipliers
	for mult in multipliersArray:
		stat *= mult
	
	#Return
	return(stat)

func setStats():
	stats["speed"] = getStat("speed");
	stats["mood"] = getStat("mood");
	stats["thought"] = getStat("thought");

func addCash(amt):
	self.cash += amt

func addModifier(stat: String, type:String, val: float):
	stat_mods[stat][type].append(val)

func addSingleTrait(t: String, run_set_stats: bool = true):
	var selectedTrait = TraitData.TRAIT_DATA[t]
	for group in selectedTrait:
		if "_mod" not in group:
			continue
		var subset = selectedTrait[group]
		for mod_type in subset:
			var mods_dict = subset[mod_type]
			for stat_key in mods_dict:
				var value = mods_dict[stat_key]
				if mod_type == "other":
					match stat_key:
						"cash_bonus_range":
							if role == "customer":
								addCash(randi_range(value[0], value[1]))
				else:
					addModifier(stat_key, mod_type, value)
	if run_set_stats:
		self.setStats()

func addMultipleTraits(trait_list: Array):
	for traits in trait_list:
		addSingleTrait(traits, false)
	setStats()

func assignRandTraits():
	var appliedTraits: Array = []
	var randTrait: int = -1
	var numTraits: int = randi_range(0,2)
	var prevTrait = -1
	for i in numTraits:
		if len(appliedTraits) >= len(TraitData.TRAIT_LIST):
			break 
		while randTrait == prevTrait || randTrait in appliedTraits:
			randTrait = randi_range(0,len(TraitData.TRAIT_LIST)-1)
		appliedTraits.append(randTrait)
		prevTrait = randTrait
	for i in appliedTraits:
		self.traits.append(TraitData.TRAIT_LIST[i])

func updateLabel():
	$info_label.text = char_name
