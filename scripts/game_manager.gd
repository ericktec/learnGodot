class_name GameManager extends Node

@export var hud: HUD

var score: int = 0

func add_point()->void:
	score +=1
	hud.update_coins_collected(score)
	
