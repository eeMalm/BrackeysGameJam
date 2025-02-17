extends CharacterBody2D


const SPEED : float = 6000.0
const MAXSPEED : float = 600.0
var Direction : Vector2
var Friction : float = 0.0

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
	
	#fix this tommorow, dosent work well right now.
	if velocity.length() < MAXSPEED:
		velocity += Direction * SPEED * delta
		
		
	if Direction.x == 0:
		velocity.x *= Friction * delta
	if Direction.y == 0:
		velocity.y *= Friction * delta
	
	
	move_and_slide()
