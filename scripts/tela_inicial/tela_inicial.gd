extends Node2D

# Referência ao AnimationPlayer / AnimationPlayer Reference
var animation_playerRafa = null

func _ready(): 
	#iniciar sem rodar a função _process para rafa ficar parada. / Inicialize without running _process function so Rafa stays idle
	set_process(false) 

# ativar timer e ativar o _process(rafa andar) / Activate timer and activate _process (Rafa walks)
func _on_botao_enter_pressed():
	$btn_fases.visible = false
	$botsobre.visible = false
	$botcontroles.visible = false
	
	$Timer.start() 
	#comecar process / inicialize process
	set_process(true)
	$AudioStreamPlayer.play()

# loop para movimentação da rafa / Rafa movement loop
func _process(delta):
	#movimentar Rafa / Move Rafa
	var speedRafa = -140
	$RafaProtagonista.position.x += speedRafa * delta

	if position.x != 1:
		$RafaProtagonista/AnimationPlayer.play("andarembora")
		
		#parar assim que sair da tela / Stops as soon ascharacter leaves the screen
	if  position.x < 0:
		speedRafa = 0

# trocar de tela ao clicar "enter" no teclado / Change screen when  "enter" is pressed"
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ENTER:
			if event.pressed:
				_on_botao_enter_pressed()
				$AudioStreamPlayer.play()

# função timer / Timer function
func _on_Timer_timeout(): 
	#quando timer finalizar executar função (trocar para proxima tela) / On timeout run function and change to next screen
	get_tree().change_scene("res://cenas/cena_1.tscn")
	

func _on_btn_fases_pressed():
	$exemplo_button_sobre.visible = true

func _on_botcontroles_pressed():
	$exemplo_button_sobre.visible = true
	$botsair.visible = true

func _on_botsobre_pressed():
	$exemplo_button_sobre.visible = true
	$botsair.visible = true

func _on_botsair_pressed():
	$exemplo_button_sobre.visible = false
	$botsair.visible = false 

