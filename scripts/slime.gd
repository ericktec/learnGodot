extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const horizontal_speed: int = 60
var direction: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func check_if_patform_edge():
	return not ray_cast_2d.is_colliding()

func reverse_direction():
	if check_if_patform_edge() or is_on_wall():
		direction *=-1
		ray_cast_2d.position.x *= -1
		animated_sprite_2d.flip_h = direction < 0
		

func movement(delta: float):
	position.x += horizontal_speed * delta * direction
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

func _physics_process(delta: float) -> void:
	reverse_direction()
	movement(delta)
	move_and_slide()
