extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -350.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var double_jump_available = false
var double_jump_unlocked = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Only allow double jump if it's been unlocked
	if double_jump_unlocked:
		double_jump_available = true
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif double_jump_unlocked and not is_on_floor():
			velocity.y = JUMP_VELOCITY
			double_jump_unlocked = false
	
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else: 
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func unlock_double_jump():
	double_jump_unlocked = true
