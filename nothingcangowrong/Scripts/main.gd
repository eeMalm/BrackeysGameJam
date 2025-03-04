extends Node2D

var Sneak : bool
var ReactionZone : Vector2 = Vector2(7, 8)

# To Do: write the human AI to handle reaction times
var ReactionTime : float
var RatStack : Array[Array]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Sneak = $Rat.Sneak


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Sneak = $Rat.Sneak
	#ugly way of checking we are in a house
	if $Camera2D.cmode == "house":
	# Handling global sneako efffects
		if Sneak:
			for n in get_tree().get_nodes_in_group("Enemies"):
				n.ReactionZone = ReactionZone * 0.6
				
		if !Sneak:
			for n in get_tree().get_nodes_in_group("Enemies"):
				n.ReactionZone = ReactionZone
			

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

func start_battle() -> void:
	RatStack.push_back([$Rat.position, PackedScene.new().pack($Enviornment.get_child(0)), $Camera2D.cmode])
	#Enviornemnt may never have more than 1 child
	$Enviornment.remove_child($Enviornment.get_child(0))
	$Enviornment.add_child(load("res://Scenes/combat.tscn").instantiate())
	#im assuming thats the position Nodarbs wants?
	$"Rat".position = Vector2(0, 0)
	$Camera2D.cmode = "combat"
	pass

func start_house1() -> void:
	var prev_scene = PackedScene.new()
	prev_scene.pack($Enviornment.get_child(0))
	RatStack.push_back([$Rat.position + Vector2(0, 40), prev_scene, $Camera2D.cmode])
	#Enviornemnt may never have more than 1 child
	$Enviornment.remove_child($Enviornment.get_child(0))
	$Enviornment.add_child(load("res://Scenes/house_1.tscn").instantiate())
	$"Rat".position = Vector2(0, 0)
	$Camera2D.cmode = "house"
	pass



func exit_scene() -> void:
	$Rat.position = RatStack[-1][0]
	#Enviornemnt may never have more than 1 child
	$Enviornment.remove_child($Enviornment.get_child(0))
	$Enviornment.add_child(RatStack[-1][1].instantiate())
	$Camera2D.cmode = RatStack[-1][2]
	RatStack.pop_back()
