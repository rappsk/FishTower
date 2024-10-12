extends Node2D
var boxHeight = 0
@onready var entities = $Background/Foreground/Entities

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.towerHeight != boxHeight:
		place_fish()

func place_fish():
	var y = 18 - boxHeight
	var layer = 2
	var coords = Vector2i(52,y)
	var source_id = 0
	var atlas_coords = Vector2i(4,3)
	entities.set_cell(coords, source_id, atlas_coords)
	boxHeight = boxHeight + 1
