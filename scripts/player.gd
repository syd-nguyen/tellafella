extends CharacterBody2D

const SPEED = 300.0
var lastDirection: Vector2 = Vector2.RIGHT
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	process_movement()
	process_animation()
	move_and_slide()
	
# ---------------------------------------------
# movement and animation
# ---------------------------------------------

func process_movement() -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		lastDirection = direction
	else:
		velocity = Vector2.ZERO

func process_animation() -> void:
	if velocity != Vector2.ZERO:
		play_animation("run", lastDirection)
	else:
		play_animation("idle", lastDirection)

func play_animation(prefix: String, direction: Vector2) -> void:
	if direction.x > 0:
		animated_sprite_2d.play(prefix + " right")
	elif direction.x < 0:
		animated_sprite_2d.play(prefix + " left")
	#elif direction.y < 0:
		#animated_sprite_2d.play(prefix + " up")
	#elif direction.y > 0:
		#animated_sprite_2d.play(prefix + " down")

# -------------------------
# collision detection
# -------------------------

func _on_hitbox_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_hitbox_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("hit")
