extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("idle")
	player.jumps_left = player.number_of_jumps_allowed

func on_physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		state_machine.change_state(player.states.Running)
	super.on_physics_process(delta)

func on_input(event):	
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state(player.states.Jumping)
