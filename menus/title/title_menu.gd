extends Control

#func _ready():
	#AudioPlayer.play_level_music()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://menus/options/OptionsMenu.tscn")


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://menus/title/TitleMenu.tscn")
