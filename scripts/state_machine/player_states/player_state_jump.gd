extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("idle")
	player.velocity.y = player.JUMP_VELOCITY
	

func on_physics_process(delta: float) -> void:
	player.handle_movement_and_direction(Input.get_axis("ui_left", "ui_right"), player.SPEED)

	
	if not player.is_on_floor():
		state_machine.change_state(player.states.Falling)
	super.on_physics_process(delta)

func on_input(event):
	pass
