extends PathFollow2D

@export var SPEED = 50
@export var human_health = 3

func _physics_process(delta):
	progress += delta * SPEED	
	
func take_damage(damage):
	human_health -= damage
	if human_health <= 0:
		get_parent().get_parent().get_parent().coins += 1
		queue_free()
