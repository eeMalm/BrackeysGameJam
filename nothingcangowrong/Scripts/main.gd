extends Node2D

var Sneak : bool
var ReactionZone : Vector2 = Vector2(7, 9)

# To Do: write the human AI to handle reaction times
var ReactionTime : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Sneak = $Rat.Sneak


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	# Handling global sneako efffects
	if Sneak:
		for n in get_tree().get_nodes_in_group("Enemies"):
			n.get_node("/root/Main/HumanPath/PathFollow2D/Human/SightArea/CollisionShape2D").scale = ReactionZone * 0.6
	if !Sneak:
		for n in get_tree().get_nodes_in_group("Enemies"):
			n.get_node("/root/Main/HumanPath/PathFollow2D/Human/SightArea/CollisionShape2D").scale = ReactionZone

func effect(item: String) -> void:
	if item == "cheese":
		#increase max health points
		$Rat.Max_Health += 1
		#restore health to max
		$Rat.Health = $Rat.Max_Health
	if item == "candy":
		$Rat.MAXSPEED *= 1.5
		$Rat.ACCELERATION *= 1.5
	if item == "camo":
		ReactionZone  *= 0.8
		ReactionTime += 1
		pass
	if item == "dentures":
		#Run a function  to enable attacking, though we probably wont have time to add it
		pass
		
		
	
