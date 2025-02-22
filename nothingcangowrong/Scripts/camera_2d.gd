extends Camera2D

var cmode : String = "house"
var rat :CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	rat = get_parent().get_node("Rat")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if cmode == "combat":
		#configure the camera here
		position = Vector2(0, 0)
		zoom = Vector2(1, 1)
		
	elif cmode == "house":
		position = position.lerp(rat.position, 4.5 * delta)
		zoom = Vector2(3.75, 3.75)
	
	elif cmode == "street":
		pass
