extends CharacterBody2D

@onready var all_interactions = []
const SPEED = 10.0
@onready var hasFish = false
@onready var hookInstance = $Sprite2D/HookAndLine

func _process(delta: float) -> void:
	if hasFish and position.y < 25:
		Global.fishCount = Global.fishCount + 1
		print(position.y)
		get_tree().change_scene_to_file("res://scenes/world.tscn")

func _physics_process(delta):
	execute_interaction()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 0.025

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("walk_left", "walk_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_pressed("interact"):
		velocity.y = delta * -1000
		# 25 to catch
	
	move_and_slide()

func _on_interaction_area_area_entered(area):
	all_interactions.insert(0,area)

func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)

func execute_interaction():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		if !hasFish:
			hasFish = true
			var layer = 2
			var coords = Vector2i(0,0)
			var source_id = 0
			var atlas_coords = Vector2i(4,1)
			#  void set_cell(coords: Vector2i, source_id: int = -1, atlas_coords: Vector2i = Vector2i(-1, -1), alternative_tile: int = 0)
			hookInstance.set_cell(coords, source_id, atlas_coords)
			print("hook gottem")
 		
