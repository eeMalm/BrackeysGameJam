extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sight_area_2_body_entered(body: Node2D) -> void:
		#what to do when human sees rat
	print("The human saw a rat!!!")#<--remove later
