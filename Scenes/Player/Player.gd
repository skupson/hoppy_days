extends KinematicBody2D

var motion = Vector2(0, 0)
var speed = 1250
var jump_speed = 2000
var gravity = 100

signal animate

# warning-ignore:unused_argument
func _physics_process(delta):
	apply_gravity()
	animate()
	movement()
	
	
func apply_gravity():
	if not is_on_floor():
		motion.y += gravity
	elif is_on_ceiling():
		motion.y = 1
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
	motion = move_and_slide(motion, Vector2.UP)

func animate():
	emit_signal("animate", motion)
	
