extends CharacterBody2D
class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var horizontal_speed = 130.0
@export var jump_height: float = 100.0
@export var jump_time_to_peak: float = 0.5
@export var jump_time_to_descent: float = 0.4
@export var jump_stop_factor: float = 0.5

@onready var jump_velocity: float = -(2.0 * jump_height) / jump_time_to_peak
@onready var jump_gravity: float = -(-2.0 * jump_height) / (jump_time_to_peak *jump_time_to_peak )
@onready var fall_gravity: float = -(-2.0 * jump_height) / (jump_time_to_descent ** 2)

@export var number_of_jumps_allowed: int = 1
var jumps_left: int

var states:PlayerStatesNames = PlayerStatesNames.new()

func take_damage():
	pass
	

func play_animation(animation_name: String)-> void:
	animated_sprite_2d.play(animation_name)

func get_jump_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func handle_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.x += get_gravity().x * delta
		velocity.y += get_jump_gravity() * delta

func handle_movement_and_direction(direction: float, speed: float)->void:
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	velocity.x = direction * speed

func _physics_process(delta: float) -> void:
	pass
