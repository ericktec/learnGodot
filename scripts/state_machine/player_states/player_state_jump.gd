extends PlayerStateBase

var time_in_air: float = 0
var time_allowed_in_air: float = 0.5

func enter():
	super.enter()
	time_in_air = 0
	player.velocity.y = player.jump_velocity
	player.play_animation("idle")
	
	

func on_physics_process(delta: float) -> void:
	player.handle_movement_and_direction(Input.get_axis("move_left", "move_right"), player.horizontal_speed)
	
	time_in_air += delta
	if (not player.is_on_floor() and player.velocity.y > 0) or not Input.is_action_pressed("jump") or time_in_air >= time_allowed_in_air:
		player.velocity *= player.jump_stop_factor
		state_machine.change_state(player.states.Falling)
		
	super.on_physics_process(delta)

	
func exit():
	pass
