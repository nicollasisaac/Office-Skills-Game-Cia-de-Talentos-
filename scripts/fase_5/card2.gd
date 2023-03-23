extends Sprite

var mouseIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#quando mouse entrar na area e botao for clicado mover o card para posicao do mouse.
func _process(delta):
	if(mouseIn && Input.is_action_pressed("click")):
		set_position(get_viewport().get_mouse_position())
		Global.card2mexe = true
	pass

#quando o mouse entrar na area determinada ativar "mousein" 
func _on_Area2D_mouse_entered():
	mouseIn = true
	pass

#quando o mouse sair na area determinada desativar "mousein" 
func _on_Area2D_mouse_exited():
	mouseIn = false
	pass
