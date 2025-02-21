extends Node2D
var prevPos : float = 0
var deltaV : float
@export var HumanSpeed : float = 200
@export var NodeArray : Array[Vector2] = []
var CurrentIndex : int = 0
var noticed : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position.move_toward(NodeArray[CurrentIndex], HumanSpeed * delta)
	if !noticed:
		if position > NodeArray[CurrentIndex] * randf_range(0.8, 0.9) && position < NodeArray[CurrentIndex] * randf_range(1.1, 1.2):
			HumanSpeed *= randf_range((1/1.2), 1.2)
			CurrentIndex += 1
			CurrentIndex %= NodeArray.size()
	else:
		HumanSpeed *= 0.5
		position = position.move_toward(NodeArray[CurrentIndex], HumanSpeed * delta)
	deltaV = position.x - prevPos
	if deltaV < 0:
		$AnimatedSprite2D.scale = Vector2(-1, 1)
	if deltaV > 0:
		$AnimatedSprite2D.scale = Vector2(1, 1)
	prevPos = position.x


#func _on_sight_area_body_entered(body):
#	print()
#	if body.is_in_group("Player"):
#		get_tree().change_scene_to_file("res://Scenes/combat.tscn")#probably going to need to add a delay, but it works for now
#		
#		
#		print("The human saw a rat!!!")#<--remove later
#scene switcher has been moved to rat script
