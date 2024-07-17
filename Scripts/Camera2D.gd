extends Camera2D

var ZoomMin = Vector2(0.6,0.6)
var ZoomMax = Vector2(1,1)
var ZoomSpd = Vector2(0.3,0.3)
var PanSpeedKey = 8

func _process(_delta):
	if Input.is_action_pressed("MoveCamUp"):
		position.y -= PanSpeedKey
	if Input.is_action_pressed("MoveCamDown"):
		position.y += PanSpeedKey
	if Input.is_action_pressed("MoveCamLeft"):
		position.x -= PanSpeedKey
	if Input.is_action_pressed("MoveCamRight"):
		position.x += PanSpeedKey
	
func _input(event):
	if event.is_action_pressed("ScrollZoomOut"):
		if zoom > ZoomMin:
			zoom -= ZoomSpd
	if event.is_action_pressed("ScrollZoomIn"):
		if zoom < ZoomMax:
			zoom +=ZoomSpd
