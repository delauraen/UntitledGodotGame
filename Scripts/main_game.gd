extends Node2D

@export var human : PackedScene = preload("res://Scenes/human_mob.tscn")
@onready var path = $LevelOne/Path
@onready var spawn = $LevelOne/Path/Spawn
@onready var total_coins = $HUD/totalCoins
@onready var total_cheese = $HUD/totalCheese
@onready var total_waves = $HUD/currentWave
@onready var enemies_left = $HUD/enemiesLeft

var current_wave = 0
var alive_enemies = 0
var spawn_cooldown = 0.5
var coins = 0
var cheese = 10

func _ready():
	var wave_data = iterate_wave()
	await(get_tree().create_timer(0.2).timeout)
	spawn_wave(wave_data)

func _physics_process(delta):
		total_cheese.text = "Cheese x " + str(cheese)
		total_coins.text = "Coins x " + str(coins)
		total_waves.text = "Current Wave: " + str(current_wave)
		enemies_left.text = "Enemies Left: " + str(alive_enemies)

func iterate_wave():
	var wave_mobs = [["human_mob", spawn_cooldown], ["human_mob", spawn_cooldown], 
		["human_mob", spawn_cooldown], ["human_mob", spawn_cooldown]]
	current_wave += 1
	alive_enemies = wave_mobs.size()
	return wave_mobs
	
func spawn_wave(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Scenes/" +  i[0] + ".tscn").instantiate()
		path.add_child(new_enemy)
		new_enemy.SPEED = 50
		await(get_tree().create_timer(i[1]).timeout)
			

func _on_end_zone_body_entered(body):
	if body.is_in_group("wave_mobs"):
		body.queue_free()
	cheese -= 1
	if cheese <= 0:
		print("choo lose!")
