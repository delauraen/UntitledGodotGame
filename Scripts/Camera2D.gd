extends Camera2D

var ZoomMin = Vector2(0.6,0.6)
var ZoomMax = Vector2(1,1)
var ZoomSpd = Vector2(0.3,0.3)
var PanSpeedKey = 8

func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("MoveCamUp"):
		position.y -= PanSpeedKey
		print("MoveCamUp")
	if Input.is_action_pressed("MoveCamDown"):
		position.y += PanSpeedKey
		print("MoveCamDown")
	if Input.is_action_pressed("MoveCamLeft"):
		print("MoveCamLeft")
		position.x -= PanSpeedKey
	if Input.is_action_pressed("MoveCamRight"):
		position.x += PanSpeedKey
		print("MoveCamRight")
	
func _input(event):
	if event.is_action_pressed("ScrollZoomOut"):
		if zoom > ZoomMin:
			zoom -= ZoomSpd
		print("Zoom out")
	if event.is_action_pressed("ScrollZoomIn"):
		if zoom < ZoomMax:
			zoom +=ZoomSpd
		print("Zoom in")
	print(zoom)
	pass
