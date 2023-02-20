extends KinematicBody2D

var animation_player = null

func _process(delta):
	animation_player = get_node("Eli/eliAnim") #Ativar movimentação da Eli enquanto estiver parada.
	animation_player.play("idleMovendo")
