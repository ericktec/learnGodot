extends PlayerStateBase

func enter():
	super.enter()
	player.play_animation("idle")

	
	

func on_physics_process(delta: float) -> void:
	player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.SPEED
	if player.is_on_floor():
		state_machine.change_state(player.states.Idle)
	super.on_physics_process(delta)

func on_input(event):
	
	if Input.is_action_just_pressed("ui_accept") and not player.is_on_floor() and player.jumps_left > 0:
		state_machine.change_state(player.states.Jumping)
