extends KinematicBody2D


const speed = 200

func _process(_delta):
	var velocity = Vector2.ZERO
	
	# keybord keys
	if Input.is_action_pressed("ui_left"):  # left key on keybord:
		velocity.x -= 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if Input.is_action_pressed("ui_right"):  #right key on keybord:
		velocity.x += 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1	
	move_and_slide(velocity.normalized() * speed) # connects the picture to the code
	player_animation(velocity)
	
func player_animation(velocity):
	if  velocity.y > 0:
		$'AnimatedSprite'.play('walk_down')
	elif velocity.y < 0:
		$'AnimatedSprite'.play('walk_up')
	elif velocity.x != 0:
		$'AnimatedSprite'.play('walk_side')
		$"AnimatedSprite".flip_h = velocity.x > 0
	else:
		$'AnimatedSprite'.stop()
		$"AnimatedSprite".frame = 0	
