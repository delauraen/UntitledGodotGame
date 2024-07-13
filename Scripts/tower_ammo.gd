extends CharacterBody2D

@onready var timer = $Timer

var SPEED: float = 300
var damage = 1
var enemy = null
var direction := Vector2.RIGHT

func _ready() -> void:
	timer.start()

func _physics_process(delta: float) -> void:
	if enemy != null: 
		direction = enemy.global_position - global_position
		direction = direction.normalized()
		look_at(direction+global_position)
	
	var v = direction * SPEED * delta
	var c: = move_and_collide(v)
	if c:
		c.get_collider().queue_free()
		queue_free()
	
func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("wave_mobs"):
		body.apply_damage(damage)
		queue_free()
	
func _on_timer_timeout():
	queue_free()
