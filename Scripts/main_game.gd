extends Node2D

@export var human : PackedScene = preload("res://Scenes/human_mob.tscn")
@onready var path = $LevelOne/Path
@onready var spawn = $LevelOne/Path/Spawn

var current_wave = 0
var enemies_in_wave = 0

func _ready():
	var wave_data = iterate_wave()
	await(get_tree().create_timer(0.2).timeout)
	spawn_wave(wave_data)

func iterate_wave():
	var wave_mobs = [["human_mob", 1], ["human_mob", 1], ["human_mob", 1], ["human_mob", 1], ["human_mob", 1], ["human_mob", 1], ["human_mob", 1], ["human_mob", 1]]
	current_wave += 1
	enemies_in_wave = wave_mobs.size()
	return wave_mobs
	
func spawn_wave(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Scenes/" +  i[0] + ".tscn").instantiate()
		path.add_child(new_enemy)
		await(get_tree().create_timer(i[1]).timeout)
			
		
