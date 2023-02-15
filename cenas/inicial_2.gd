extends Node2D

func _ready(): #rafa se movimentar enquanto parada na tela
	$KinematicBody2D/RafaProtagonista/AnimationPlayer.play("olharlados")

func _on_botao_enter_pressed(): #trocar de tela clicando no botaoenter com o mouse 
	get_tree().change_scene("res://cenas/cena_1.tscn")

func _input(event): #trocar de tela ao clicar "enter" no teclado
	if event is InputEventKey:
		if event.scancode == KEY_ENTER:
			if event.pressed:
				_on_botao_enter_pressed()



