extends Node2D

class_name Person

#@onready var info_label = $info_label

var char_name: String
var role: String
var traits: Array = []


var mood_val: float
var speed_val: float = 100 #this will be modified by tags

func updateLabel():
	var label_text = "Name: %s \nType: %s \nSpeed: %d" % [char_name, role, speed_val]
	if self is Customer:
		label_text += " \nCash: $%.2f" % self.cash
	$info_label.text = label_text
	
#func applyTraits():
#	for trait in traits:
		
		
func assignTraits():
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
