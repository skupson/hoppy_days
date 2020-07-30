extends KinematicBody2D

var motion = Vector2(0, 0)
var speed = 500
var gravity = 100

func _physics_process(delta):
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = 1
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -1
	else:
		motion.x = 0
	move_and_slide(motion * speed)
