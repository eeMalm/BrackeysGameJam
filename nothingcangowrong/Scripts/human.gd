extends Node2D
var prevPos : float = 0
var deltaV : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	deltaV = get_parent().position.x - prevPos
	if deltaV < 0:
		$AnimatedSprite2D.scale = Vector2(-1, 1)
	if deltaV > 0:
		$AnimatedSprite2D.scale = Vector2(1, 1)
	prevPos = get_parent().position.x
		
#func _on_sight_area_body_entered(body):
#	print()
#	if body.is_in_group("Player"):
#		get_tree().change_scene_to_file("res://Scenes/combat.tscn")#probably going to need to add a delay, but it works for now
#		
#		
#		print("The human saw a rat!!!")#<--remove later
#scene switcher has been moved to rat script
