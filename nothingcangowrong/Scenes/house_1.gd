@tool

extends Node2D


# Called when the node enters the scene tree for the first time.
func _draw() -> void:
	if Engine.is_editor_hint():
		for n in get_tree().get_nodes_in_group("Enemies"):
			for pos in n.NodeArray:
				draw_circle(pos, 10, Color.RED, true, -1.0, false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass
