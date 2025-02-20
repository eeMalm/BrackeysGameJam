extends CharacterBody2D


const SPEED = -300.0
var forward: bool = true

func _physics_process(delta: float) -> void:
	if position.x <0:
		forward=false
	if forward:
		velocity.x=SPEED
	else:
		velocity.x=-SPEED
	move_and_slide()
