extends Node2D
var animation_player = null # Referência ao AnimationPlayer

func _process(delta): #ao clicar os botões aarecer o tutorial do mesmo.
	if Input.is_action_just_pressed("pressed_enter"):
		print("boa")
		animation_player = get_node("botenter/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para confirmar e pular as falas"
	if Input.is_action_just_pressed("move_right"):
		print("boa")
		animation_player = get_node("botdireita/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para mover-se para direita."
	if Input.is_action_just_pressed("move_left"):
		print("boa")
		animation_player = get_node("botesquerda/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para mover-se para esquerda."
	if Input.is_action_just_pressed("press_tab"):
		print("boa")
		animation_player = get_node("bottab/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para abrir as configurações do jogo."
	
	
	
		
		
		

		




	
