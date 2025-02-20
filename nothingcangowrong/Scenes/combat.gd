extends Node2D
var Health : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# accessing Health from rat.gd here, whenevr changing Health locally, please also update the variable in rat.gd
	# I tried finding a smart solution, but gdscript doesnt have pointers so its best to just assign back and forth
	Health = get_node("root/Main/Rat").Health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_timer_timeout() -> void:
	pass
	#put functions to call attacks here
