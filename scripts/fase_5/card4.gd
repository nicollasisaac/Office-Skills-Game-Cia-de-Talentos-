extends Sprite

var mouseIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(mouseIn && Input.is_action_pressed("click")):
		set_position(get_viewport().get_mouse_position())
		Global.card4mexe = true
	pass


func _on_Area2D_mouse_entered():
	mouseIn = true
	pass


func _on_Area2D_mouse_exited():
	mouseIn = false
	pass
