extends Node2D

func _ready():
	pass # Replace with function body.

# texto com link conectado que leva para o conteúdo
func _on_LinkButton_pressed():
	OS.shell_open("https://youtu.be/g_Ld-p6jv3A")

# botão que leva o jogador à próxima fase
func _on_Button_pressed():
	get_tree().change_scene("res://cenas/fase_2.tscn")
