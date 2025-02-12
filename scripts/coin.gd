extends Area2D

@onready var game_manager: GameManager = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
	game_manager.add_point()
