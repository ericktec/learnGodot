extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("running")
	

func on_physics_process(delta: float) -> void:
	player.handle_movement_and_direction(Input.get_axis("move_left", "move_right"), player.horizontal_speed)
	
	if not player.is_on_floor():
		state_machine.change_state(player.states.Falling)
	super.on_physics_process(delta)

func on_input(event):
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state(player.states.Jumping)
	elif  not Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		state_machine.change_state(player.states.Idle)
	elif not player.is_on_floor():
		state_machine.change_state(player.states.Falling)
	
