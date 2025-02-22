extends Node2D
var Health : int 
var broomAttack=preload("res://Scenes/broom_attack.tscn")
var stompAttack=preload("res://Scenes/stomp_attack.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# accessing Health from rat.gd here, whenevr changing Health locally, please also update the variable in rat.gd
	# I tried finding a smart solution, but gdscript doesnt have pointers so its best to just assign back and forth
	
	Health = get_tree().root.get_node("Main/Rat").Health
	get_tree().root.get_node("Main/Rat").MAXSPEED=300.0
	$HealthBar.max_value=get_tree().root.get_node("Main/Rat").Max_Health
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HealthBar.value=get_tree().root.get_node("Main/Rat").Health
	if get_tree().root.get_node("Main/Rat").Health == 0:
		#put death function here
		pass

func _on_timer_timeout() -> void:
	randomize()
	var attacks=[broomAttack,stompAttack]
	var attackNumber=randi_range(0,attacks.size()-1)
	if attackNumber == 0:
		var attack = attacks[0].instantiate()
		attack.position=Vector2(1200,randi_range(-300,300))
		add_child(attack)
	elif attackNumber == 1:
		var attack = attacks[1].instantiate()
		attack.position=Vector2(randi_range(-600,450),-300)
		add_child(attack)
		
	
	#put functions to call attacks here
