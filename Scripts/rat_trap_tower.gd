extends Area2D

var tower_ammo = preload("res://Scenes/tower_ammo.tscn")
@onready var cannon = $cannon
var tower_radius: float = 150.0
var cooldown = 0.1

@onready var rat_tower_l = $RatTowerL
@onready var rat_tower_r = $RatTowerR
@onready var poly_path = $"../../Path/PolyPath"
var ready_to_fire = true

func _physics_process(delta):
	if ready_to_fire:
		spawn_trap()
		
func spawn_trap():	
	ready_to_fire = false
	randomize()
	var x_pos = randi_range(-tower_radius, tower_radius)
	randomize()
	var y_pos = randi_range(-tower_radius, tower_radius)
	var spawn_loc = Vector2(x_pos, y_pos)
	if Geometry2D.is_point_in_polygon (spawn_loc, poly_path.polygon):
		var new_trap = tower_ammo.instantiate()
		new_trap.global_position = spawn_loc
		new_trap.SPEED = 0
		add_child(new_trap)	
		#await(get_tree().create_timer(cooldown).timeout)
	ready_to_fire = true
