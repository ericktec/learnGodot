class_name StateBase extends Node

@onready var controller_node: Node = self.owner

var state_machine: StateMachine

func enter():
	pass
	
func exit():
	pass
	
	
func can_change_state(new_state: String) -> bool:
	return true

func on_process(delta: float) -> void:
	pass

func on_physics_process(delta: float) -> void:
	pass

func on_input(event: InputEvent) -> void:
	pass
	
func on_unhandled_input(event: InputEvent) -> void:
	pass
	
func on_unhandled_key_input(event: InputEvent) -> void:
	pass
