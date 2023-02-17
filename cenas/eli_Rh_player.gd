extends KinematicBody2D

var animation_player = null

func _process(delta):
	animation_player = get_node("Eli/eliAnim")
	animation_player.play("idleMovendo")
