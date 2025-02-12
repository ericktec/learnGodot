class_name PlayerStateBase extends StateBase

var player: Player

func enter():
	player = controller_node

func on_physics_process(delta: float) -> void:
	player.handle_gravity(delta)
	player.move_and_slide()
