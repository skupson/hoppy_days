extends AnimatedSprite

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
