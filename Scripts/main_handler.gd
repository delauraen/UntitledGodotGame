extends Control


func _ready():
	get_node("MainMenu/MarginContainer/VBoxContainer/NewGame").pressed.connect(on_new_game_pressed)
	get_node("MainMenu/MarginContainer/VBoxContainer/Quit").pressed.connect(on_quit_pressed)
func on_new_game_pressed():
	get_node("MainMenu").queue_free()
	var game_scene = load("res://Scenes/main_game.tscn").instantiate()
	add_child(game_scene)
func on_quit_pressed():
	get_tree().quit()
