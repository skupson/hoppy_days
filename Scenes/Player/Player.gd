extends KinematicBody2D

onready var player_sprite = $AnimatedSprite

var motion = Vector2(0, 0)
var speed = 750
var jump_speed = 1500
var gravity = 75

func _physics_process(delta):
	apply_gravity()
	animate()
	movement()
	
func apply_gravity():
	if not is_on_floor():
		motion.y += gravity
	else:
		motion.y = 0

func movement():
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = speed
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -speed
	else:
		motion.x = 0
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= jump_speed
	move_and_slide(motion, Vector2.UP)

func animate():
	if motion.x != 0:
		if motion.x > 0:
			player_sprite.set_flip_h(false)
		else:
			player_sprite.set_flip_h(true)
		player_sprite.play("walk")
	elif motion.y != 0:
		player_sprite.play("jump")
	elif motion.x == 0 and motion.y == 0:
		player_sprite.play("idle")
	
