extends CharacterBody2D


const SPEED = 10.0

func _physics_process(delta):
	#if Input.is_action_just_pressed("interact"):
		#execute_interaction()
	
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
		print(position.y) # 25 to catch
		print(position.x)
	
	move_and_slide()
