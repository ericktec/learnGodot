extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("running")
	

func on_physics_process(delta: float) -> void:
	player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.SPEED
	
	if not player.is_on_floor():
		state_machine.change_state(player.states.Falling)
	super.on_physics_process(delta)

func on_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state(player.states.Jumping)
	elif  not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		state_machine.change_state(player.states.Idle)
	elif not player.is_on_floor():
		state_machine.change_state(player.states.Falling)
	
