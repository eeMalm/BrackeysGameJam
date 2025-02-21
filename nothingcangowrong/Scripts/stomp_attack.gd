extends CharacterBody2D


const SPEED = 300.0
var up: bool = true

func _physics_process(delta: float) -> void:
	if position.y >650:
		up=false
	if up:
		velocity.y=SPEED
	else:
		velocity.y=-SPEED
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("boot deleted")
