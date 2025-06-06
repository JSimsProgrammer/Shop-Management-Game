extends Node2D

@export var person_scene: PackedScene
@export var employee_script: Script
@export var customer_script: Script

var spawn_count := 0
var max_per_row := 10
var max_spawns := 30
var spacing := Vector2(300, 300)
var current_row := 0
var is_next_customer := true

var names = ["Jordan", "Kenneth", "Kevin", "Joe", "Connor", "Griffin", "Zelda"]

func _ready():
	spawnNext()
	
func spawnNext():
	# Create new person
	var person = person_scene.instantiate()
	person.set_script(customer_script if is_next_customer else employee_script)
	
	# Randomize properties
	person.char_name = names.pick_random()
	person.mood_val = randf_range(0, 10)
	person.speed_val = randf_range(90, 110)
	
	if person is Customer:
		person.cash = randi_range(5, 50)
		person.role = "customer"
	else:
		person.role = "employee"
	
	# Position and add to scene
	person.position = self.position
	get_parent().add_child(person)
	
	# Move Spawner
	spawn_count += 1
	self.position.x += spacing.x
	
	if spawn_count % max_per_row == 0:
		self.position.x = 0
		self.position.y += spacing.y
		current_row += 1
		
	# Swap type
	is_next_customer = !is_next_customer
		
	# Update Label
	person.update_label()
	
	#Continue Spawn after row
	if spawn_count < max_spawns:
		await get_tree().create_timer(.2).timeout
		spawnNext()
