extends PathFollow2D

var SPEED = 50

func _physics_process(delta):
	progress += delta * SPEED	
