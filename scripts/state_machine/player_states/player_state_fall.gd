extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("idle")
	player.jumps_left -= 1

func on_physics_process(delta: float) -> void:
	player.handle_movement_and_direction(Input.get_axis("move_left", "move_right"), player.horizontal_speed)
	if player.is_on_floor():
		state_machine.change_state(player.states.Idle)
	super.on_physics_process(delta)

func on_input(event):
	
	if Input.is_action_just_pressed("jump") and not player.is_on_floor() and player.jumps_left > 0:
		state_machine.change_state(player.states.Jumping)
