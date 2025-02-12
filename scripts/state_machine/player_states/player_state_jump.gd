extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("idle")
	player.velocity.y = player.JUMP_VELOCITY
	player.jumps_left -= 1
	

func on_physics_process(delta: float) -> void:
	player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.SPEED
	
	if not player.is_on_floor():
		state_machine.change_state(player.states.Falling)
	super.on_physics_process(delta)

func on_input(event):
	pass
