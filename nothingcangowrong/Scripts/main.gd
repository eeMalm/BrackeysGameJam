extends Node2D

var Sneak : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Sneak = $Rat.Sneak


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	# Handling global sneako efffects
	if Sneak:
		for n in get_tree().get_nodes_in_group("Enemies"):
			n.get_node("/root/Main/HumanPath/PathFollow2D/Human/SightArea/CollisionShape2D").scale = Vector2(4, 5)
	if !Sneak:
		for n in get_tree().get_nodes_in_group("Enemies"):
			n.get_node("/root/Main/HumanPath/PathFollow2D/Human/SightArea/CollisionShape2D").scale = Vector2(7, 9)
		
