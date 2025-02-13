extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("idle")
	player.jumps_left = player.number_of_jumps_allowed

func on_physics_process(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, player.horizontal_speed)
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.change_state(player.states.Running)
	super.on_physics_process(delta)

func on_input(event):	
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state(player.states.Jumping)
