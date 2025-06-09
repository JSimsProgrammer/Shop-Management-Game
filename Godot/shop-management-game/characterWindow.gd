extends Control

var current_person: Person

func showFor(p: Person):
	current_person = p
	$Panel/nameLabel.text = "Name: %s" % p.char_name
	$Panel/roleLabel.text = "Role: %s" % p.role
	$Panel/traitsLabel.text = "Traits: %s" % ", ".join(p.traits)
	$Panel/moodProgress/moodVal.text = str(p.stats["mood"])
	$Panel/moodProgress.value = p.stats["mood"]
	$Panel/speedProgress/speedVal.text = str(p.stats["speed"])
	$Panel/speedProgress.value = p.stats["speed"]
	$Panel/thoughtProgress/thoughtVal.text = str(p.stats["thought"])
	$Panel/thoughtProgress.value = p.stats["thought"]
