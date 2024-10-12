extends Node2D

var fish = preload("res://scenes/Fish.tscn")
var totalFish = 10
var fishInstances = []

func spawnFish(pos):
	var instance = fish.instantiate()
	instance.position = pos
	add_child(instance)
	fishInstances.append(instance)
	#print("Fish instance: " + str(fishInstances) + " at: " + str(pos))

func _process(delta: float) -> void:
	while fishInstances.size() < totalFish:
		var y = randi_range(200,250) 
		var x = randi_range(350, 450) 
		var pos = Vector2(x,y)
		spawnFish(pos)
	for fish in fishInstances:
		if is_instance_valid(fish) and randi() % 50 + 1 == 7:
			fish.swim()   
		if is_instance_valid(fish) and fish.position.x < 25: 
			fishInstances.erase(fish)
			fish.queue_free()
	
