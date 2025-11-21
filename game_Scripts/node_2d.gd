extends Node2D

@onready var camera = $"../Player/Camera2D"

func _process(_delta):
	global_position = camera.global_position
