extends Node2D

class_name Person

#@onready var info_label = $info_label

var char_name: String
var mood_val: float
var speed_val: float = 100 #this will be modified by tags
var role: String


func update_label():
	var label_text = "Name: %s \nType: %s \nSpeed: %d" % [char_name, role, speed_val]
	if self is Customer:
		label_text += " \nCash: $%.2f" % self.cash
	$info_label.text = label_text
