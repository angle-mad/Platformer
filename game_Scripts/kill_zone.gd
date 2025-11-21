extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(_body):
	timer.start() # Replace with function body.


func _on_timer_timeout():
	get_tree().reload_current_scene() # Replace with function body.
