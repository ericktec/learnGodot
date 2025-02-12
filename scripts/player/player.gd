extends CharacterBody2D
class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var number_of_jumps_allowed: int = 1
var jumps_left: int

var states:PlayerStatesNames = PlayerStatesNames.new()

func take_damage():
	pass
	

func play_animation(animation_name: String)-> void:
	animated_sprite_2d.play(animation_name)

func handle_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_movement_and_direction(direction: int, speed: float)->void:
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	velocity.x = direction * speed

func _physics_process(delta: float) -> void:
	pass
