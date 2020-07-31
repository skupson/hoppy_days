extends AnimatedSprite

func _on_Player_animate(motion):
	if motion.x != 0:
		if motion.x > 0:
			set_flip_h(false)
		else:
			set_flip_h(true)
		play("walk")
	elif motion.y != 0:
		play("jump")
	elif motion.x == 0 and motion.y == 0:
		play("idle")
