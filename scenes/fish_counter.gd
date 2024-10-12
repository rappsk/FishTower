extends Label

func _process(_delta: float) -> void:
	text = "Fish Count: %s" % Global.fishCount
