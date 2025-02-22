extends CharacterBody2D


const SPEED = -600.0
var forward: bool = true

func _physics_process(delta: float) -> void:
	if position.x <-500:
		forward=false
	if forward:
		velocity.x=SPEED
	else:
		velocity.x=-SPEED
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
