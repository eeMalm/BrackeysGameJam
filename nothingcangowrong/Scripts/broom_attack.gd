extends CharacterBody2D


const SPEED = -30.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	velocity.x=SPEED
	move_and_slide()
