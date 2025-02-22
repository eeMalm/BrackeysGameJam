extends Sprite2D
@export var item : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body == get_node("/root/Main/Rat"):
		if item != null:
			get_tree().root.get_node("Main").effect(item)
			queue_free()
