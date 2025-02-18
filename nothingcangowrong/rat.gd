extends CharacterBody2D


const ACCELERATION : float = 1000 
const MAXSPEED : float = 400.0
var Direction : Vector2
var Friction : float = 0.0

func _physics_process(delta):
	Direction = Vector2(0, 0)
	if Input.is_action_pressed("W"):
		Direction += Vector2(0, -0.5)
	if Input.is_action_pressed("S"):
		Direction += Vector2(0, 0.5)
	if Input.is_action_pressed("A"):
		Direction += Vector2(-1, 0)
	if Input.is_action_pressed("D"):
		Direction += Vector2(1, 0)
	print(Direction)
	Direction = Direction.normalized()
	
	#fix this tommorow, dosent work well right now.
	if velocity.length() < MAXSPEED:
		velocity += Direction * ACCELERATION * delta
	velocity = velocity.length()*Direction
	
	if Direction.x == 1:
		$Sprite2D.scale = Vector2(1, 1)
	elif Direction.x == -1:
		$Sprite2D.scale = Vector2(-1, 1)
	
	#if Direction.x == 0:
	#	velocity.x *= Friction * delta
	#if Direction.y == 0:
	#	velocity.y *= Friction * delta
	
	
	move_and_slide()
