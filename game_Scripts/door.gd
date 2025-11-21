extends Area2D

func _on_body_entered(_body):
	if get_tree().root.get_node("Game").get_node("Game_Manager").score == 5:
		get_tree().call_deferred("change_scene_to_file", "res://end.tscn")
