extends CharacterBody2D


const SPEED = 50.0

@onready var all_interactions = []
@onready var interactLabel = $InteractionComponents/InteractLabel
@onready var fishCount = 0
@onready var hasCandles = false
@onready var hasBook = false


func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		execute_interaction()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("walk_left", "walk_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_interaction_area_area_entered(area):
	all_interactions.insert(0,area)
	update_interactions()


func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	update_interactions()

func update_interactions():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""

func execute_interaction():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		match cur_interaction.interact_type:
			"print_text": print(cur_interaction.interact_value)
			"fishing": fishCount = fishCount + 1 #get_tree().change_scene_to_file("res://scenes/fishing.tscn")
			"altar": use_altar()
			"tower": use_tower()

func place_fish():
	print("Placed fish")
	fishCount = fishCount - 1

func use_altar():
	print("Alter used")

func use_tower():
	if fishCount > 0:
		place_fish()
