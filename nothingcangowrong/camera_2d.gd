extends Camera2D

var rat :CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	rat = get_parent().get_node("Rat")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.lerp(rat.position, 3 * delta)
