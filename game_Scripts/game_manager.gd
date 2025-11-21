extends Node

var score = 0

@onready var key_label: Label = $Key_Label

func add_point():
	score += 1
	key_label.text = "You Have Collected " + str(score) + " Keys"
	
 
