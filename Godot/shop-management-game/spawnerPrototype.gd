extends Node2D

@export var person_scene: PackedScene
@export var employee_script: Script
@export var customer_script: Script

var spawn_count := 0
var max_per_row := 7
var max_spawns := 30
var spacing := Vector2(550, 510)
var current_row := 0
var is_next_customer := true

var names = ["Jordan", "Kenneth", "Kevin", "Joe", "Connor", "Griffin", "Zelda"]

func _ready():
	self.position = Vector2(100,100)
	spawnNext()
	
func spawnNext():
	# Create new person
	var person = person_scene.instantiate()
	person.set_script(customer_script if is_next_customer else employee_script)
	
	# Randomize properties
	person.char_name = names.pick_random()
	
	if person is Customer:
		person.cash = randi_range(5, 50)
		person.role = "customer"
	else:
		person.role = "employee"
	
	# Position and add to scene
	person.position = (self.position)
	get_parent().add_child(person)
	
	# Assign and set Stats
	person.assignRandTraits()
	person.addMultipleTraits(person.traits)
	
	# Move Spawner
	spawn_count += 1
	self.position.x += spacing.x
	
	if spawn_count % max_per_row == 0:
		self.position.x = 100
		self.position.y += spacing.y
		current_row += 1
		
	# Swap type
	is_next_customer = !is_next_customer
		
	# Update Label
	person.updateLabel()
	
	#Continue Spawn after row
	if spawn_count < max_spawns:
		await get_tree().create_timer(.2).timeout
		spawnNext()
