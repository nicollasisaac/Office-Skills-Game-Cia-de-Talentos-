extends Node2D

var animation_player = null

func _ready(): 
	#iniciar sem rodar a função _process para rafa ficar parada
	set_process(false) 

# ativar timer e ativar o _process(rafa andar)
func _on_botao_enter_pressed():
	$Timer.start() 
	#comecar process
	set_process(true)

# loop para movimentação da rafa
func _process(delta):
	#movimentar Rafa 
	var speed = -140
	$RafaProtagonista.position.x += speed * delta

	if position.x != 1:
		$RafaProtagonista/AnimationPlayer.play("andarembora")
		
		#parar assim que sair da tela
	if  position.x < 0:
		speed = 0

# trocar de tela ao clicar "enter" no teclado
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ENTER:
			if event.pressed:
				_on_botao_enter_pressed()

# função timer
func _on_Timer_timeout(): 
	#quando timer finalizar executar função (trocar para proxima tela)
	get_tree().change_scene("res://cenas/cena_1.tscn")
	

	
