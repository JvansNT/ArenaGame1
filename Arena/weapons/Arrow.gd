extends Hitbox

var Player_exited: bool = false

var direction: Vector2 = Vector2.ZERO
var Arrow_speed: int = 0

func launch(initial_position: Vector2, dir: Vector2, speed: int) -> void:
	position = initial_position
	direction = dir
	knockback_direction = dir
	Arrow_speed = speed
	
	rotation += dir.angle() + PI/4
	
func _physics_process(delta: float) -> void:
	position += direction *Arrow_speed * delta

func _on_Arrow_body_exited(body: KinematicBody) -> void:
	if not Player_exited:
		Player_exited = true
		set_collision_mask_bit(0, true)
		set_collision_mask_bit(1, true)

func _collide(body: KinematicBody2D) -> void:
	if Player_exited:
		if body != null:
			body.take_damage(damage, knockback_direction, knockback_force)
		queue_free()
