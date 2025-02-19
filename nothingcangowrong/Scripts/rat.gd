extends CharacterBody2D


const ACCELERATION : float = 4000 
const MAXSPEED : float = 200.0
var Direction : Vector2
var Friction : float = 0.0
@export var Sneak : bool
var SneakFactor : float = 3.0
func _physics_process(delta):
	Direction = Vector2(0, 0)
	
	#OTHER INPUT
	if Input.is_action_pressed("Sneak"):
		Sneak = true
	else:
		Sneak = false
	
	#DIRECTIONAL INPUT
	if Input.is_action_pressed("W"):
		Direction += Vector2(0, -0.5)
	if Input.is_action_pressed("S"):
		Direction += Vector2(0, 0.5)
	if Input.is_action_pressed("A"):
		Direction += Vector2(-1, 0)
	if Input.is_action_pressed("D"):
		Direction += Vector2(1, 0)
	Direction = Direction.normalized()
	
	#Movement
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
	
	#Sneak, manually manipualting the raw output instead of writing it into the movement code
	
	# The Sneak variabel is copied over into main, 
	if Sneak:
		velocity /= SneakFactor
		move_and_slide()
		velocity *= SneakFactor
	else:
		move_and_slide()
	
	
