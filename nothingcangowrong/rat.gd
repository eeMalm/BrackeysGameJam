extends CharacterBody2D


const SPEED : float = 6000.0
var Direction : Vector2

func _physics_process(delta):
	Direction = Vector2(0, 0)
	if Input.is_action_pressed("W"):
		Direction += Vector2(0, -1)
	if Input.is_action_pressed("S"):
		Direction += Vector2(0, 1)
	if Input.is_action_pressed("A"):
		Direction += Vector2(-1, 0)
	if Input.is_action_pressed("D"):
		Direction += Vector2(1, 0)
	print(Direction)
	Direction = Direction.normalized()
	
	velocity = Direction * SPEED * delta
	
	
	move_and_slide()
