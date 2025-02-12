extends CharacterBody2D
class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var number_of_jumps_allowed: int = 1
var jumps_left: int

var states:PlayerStatesNames = PlayerStatesNames.new()

func death():
	pass

func play_animation(animation_name: String)-> void:
	animated_sprite_2d.play(animation_name)

func handle_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
