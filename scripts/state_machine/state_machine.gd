class_name StateMachine extends Node

@onready var controlled_node: Node = self.owner

@export var default_state:StateBase

var current_state:StateBase = null

func _state_start() -> void:
	#print("State Machine ", controlled_node.name, " start state", current_state.name)
	current_state.controller_node = controlled_node
	current_state.state_machine = self
	current_state.enter()
	
func _ready() -> void:
	call_deferred("_state_default_start")
	
func _state_default_start()-> void:
	current_state = default_state
	_state_start()
	
func change_state(new_state: String) -> void:
	var new_state_node = get_node(new_state)
	if new_state_node == current_state: return
	if current_state and current_state.has_method("exit"): current_state.exit()
	current_state = get_node(new_state)
	_state_start()
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if current_state and current_state.has_method("on_process"):
		current_state.on_physics_process(delta)

func _input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_input"):
		current_state.on_input(event)
	
func _unhandled_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_input"):
		current_state.on_unhandled_input(event)
	
func _unhandled_key_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_key_input"):
		current_state.on_unhandled_key_input(event)
