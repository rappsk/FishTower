extends CharacterBody2D


const SPEED = 30.0
const JUMP_VELOCITY = -150.0
@onready var caught = false

func swim():
	if position.y > 100:
		velocity.y = JUMP_VELOCITY
		
func catch():
	caught = true
	print ("I've been caught")
	queue_free()
	
func _physics_process(delta: float) -> void:
	if !caught:
		if not is_on_floor():
			velocity += 0.25 * get_gravity() * delta

		var direction = -1
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()


func _on_interaction_area_area_entered(area: Area2D) -> void:
	catch()
