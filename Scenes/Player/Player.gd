extends KinematicBody2D

var motion = Vector2(0, 0)
var speed = 500
var jump_speed = 500
var gravity = 10

func _physics_process(delta):
	apply_gravity()
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = speed
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -speed
	else:
		motion.x = 0
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= jump_speed
	move_and_slide(motion, Vector2.UP)
	
func apply_gravity():
	if not is_on_floor():
		motion.y += gravity
	else:
		motion.y = 0
