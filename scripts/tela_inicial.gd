extends Node2D

var animation_player = null

func _ready(): #rafa se movimentar enquanto parada na tela
#	$KinematicBody2D/RafaProtagonista/AnimationPlayer.play("olharlados")
	set_process(false) #iniciar sem rodar a função _process para rafa ficar parada

func _on_botao_enter_pressed(): #ativar timer e ativar o _process(rafa andar)
	$Timer.start() #comecar timer
	set_process(true) #comecar process
	
func _process(delta): #movimentar Rafa
	var speed = -120
	$RafaProtagonista.position.x += speed * delta

	if position.x != 1: #movimentar rafa
		$RafaProtagonista/AnimationPlayer.play("andarembora")
		
	if  position.x < 0: #parar assim que sair da tela
		speed = 0

func _input(event): #trocar de tela ao clicar "enter" no teclado
	if event is InputEventKey:
		if event.scancode == KEY_ENTER:
			if event.pressed:
				_on_botao_enter_pressed()

func _on_Timer_timeout(): #quando timer finalizar executar função (trocar para proxima tela)
	get_tree().change_scene("res://cenas/cena_1.tscn")
	

	
