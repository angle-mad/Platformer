extends Sprite2D

var counter: int = 0
var respawn_timer: float = 0.0
@onready var area_2d = get_parent()
@onready var collision_shape = $"../CollisionShape2D"

func _physics_process(delta: float) -> void:
	if respawn_timer > 0:
		respawn_timer -= delta
		if respawn_timer <= 0:
			visible = true
			area_2d.visible = true
			collision_shape.set_deferred("disabled", false)
			counter = 0

func _on_collectable_body_entered(_body):
	counter += 1
	if counter >= 1:
		print(counter)
		# Give the player double jump ability
		if _body.has_method("unlock_double_jump"):
			_body.unlock_double_jump()
	
	visible = false
	area_2d.visible = false
	collision_shape.set_deferred("disabled", true)
	respawn_timer = 3.0
