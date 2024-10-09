extends Node2D

var fish = preload("res://scenes/Fish.tscn")
var totalFish = 50
var fishInstances = 0

func spawnFish(pos):
	var instance = fish.instantiate()
	instance.position = pos
	add_child(instance)
	fishInstances = fishInstances + 1
	print("Fish instance: " + str(fishInstances) + " at: " + str(pos))

func _process(delta: float) -> void:
	while fishInstances < totalFish:
		var y = randi_range(100,250) 
		var x = randi_range(350, 450) 
		var pos = Vector2(x,y)
		spawnFish(pos)
	
