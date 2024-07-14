extends PathFollow2D

@export var SPEED = 50

func _physics_process(delta):
	progress += delta * SPEED	
