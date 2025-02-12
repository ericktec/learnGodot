class_name HUD extends Control

@onready var coins_label: Label = $HBoxContainer/CoinsLabel

func update_coins_collected(number: int):
	print(number)
	coins_label.text = "x{}".format([number], "{}")
