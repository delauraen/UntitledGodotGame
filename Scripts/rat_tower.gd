extends Area2D

var tower_ammo = preload("res://Scenes/tower_ammo.tscn")
@onready var cannon = $cannon
var ready_to_fire = true
var tower_radius: float = 250.0
var cooldown = 1
var enemies_in_range = []
@onready var rat_tower_l = $RatTowerL
@onready var rat_tower_r = $RatTowerR

func _physics_process(delta):
	if ready_to_fire:
		shoot(find_enemy())
		
func find_enemy():
	var enemies_in_range = []
	var enemy_distance = []
	for i in get_tree().get_nodes_in_group("wave_mobs"):
		if i == null || global_position.distance_to(i.global_position) > tower_radius : continue
		enemies_in_range.append(i)
		enemy_distance.append(global_position.distance_to(i.global_position))
	var min_dist = enemy_distance.min()
	if min_dist == null: return null
	var index = enemy_distance.find(min_dist)
	return enemies_in_range[index]

	
func shoot(enemy):
	if enemy == null: return
	ready_to_fire = false
	if (enemy.global_position.x-global_position.x) > 0:
		rat_tower_l.visible = false
		rat_tower_r.visible = true
	else:
		rat_tower_l.visible = true
		rat_tower_r.visible = false
	
	var bullet = tower_ammo.instantiate()
	add_child(bullet)
	bullet.global_position = cannon.global_position
	bullet.enemy = enemy
	await(get_tree().create_timer(cooldown).timeout)
	ready_to_fire = true		
