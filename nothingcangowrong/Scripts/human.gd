extends Node2D
var prevPos : float = 0
var deltaV : float
@export var HumanSpeed : float = 200
@export var NodeArray : Array[Vector2] = []
var CurrentIndex : int = 0
var noticed : bool
var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !paused:
		
		if !noticed:
			position = position.move_toward(NodeArray[CurrentIndex], HumanSpeed * delta)
			if (position > NodeArray[CurrentIndex] * randf_range(0.8, 0.9) && position < NodeArray[CurrentIndex] * randf_range(1.1, 1.2)) || position == NodeArray[CurrentIndex]:
				HumanSpeed *= randf_range((1/1.2), 1.2)
				CurrentIndex += 1
				CurrentIndex %= NodeArray.size()
		else:
			HumanSpeed *= 0.5
			position = position.move_toward(get_tree().root.get_node("Main/Rat").position, HumanSpeed * delta)
		deltaV = position.x - prevPos
		if deltaV < 0:
			$AnimatedSprite2D.scale = Vector2(-1, 1)
		if deltaV > 0:
			$AnimatedSprite2D.scale = Vector2(1, 1)
		prevPos = position.x
	
#func _on_reaction_timer_timeout():
	#if noticed:
		#get_tree().root.get_node("Main").call_deferred("start_battle")
	#pass # Replace with function body.
#
#
#func _on_sight_area_area_entered(area):
	#if area.get_parent() == get_tree().root.get_node("Main/Rat"):
		#noticed = false
#
#
#func _on_sight_area_area_exited(area):
	#print("human collsion")
	#if area.get_parent() == get_tree().root.get_node("Main/Rat"):
	##probably going to need to add a delay, but it works for now
		#$ReactionTimer.start()
		#noticed = true
		#
		#
		#
		#print("The human saw a rat!!!")#<--remove later
