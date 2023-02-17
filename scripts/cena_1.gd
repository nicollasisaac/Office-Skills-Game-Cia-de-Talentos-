extends Node2D
var animation_player = null # Referência ao AnimationPlayer

func _process(delta): #ao clicar os botões aarecer o tutorial do mesmo.
	if Input.is_action_just_pressed("pressed_enter"):
		animation_player = get_node("botenter/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para confirmar e pular as falas"
	if Input.is_action_just_pressed("move_right"):
		animation_player = get_node("botdireita/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para mover-se para direita."
	if Input.is_action_just_pressed("move_left"):
		animation_player = get_node("botesquerda/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para mover-se para esquerda."
	if Input.is_action_just_pressed("press_tab"):
		animation_player = get_node("bottab/enterAnim")
		animation_player.play("pressionando")
		$text_tutorial.text = "Utilize este botão para abrir as configurações do jogo."
	
func _physics_process(delta): #funcao que controla o a caixa de dialogo para aparecer apenas quando o jogador alcancar a posição da eli.
	$Control.visible = false #comeca com a caixa invisivel
	if $protagonistaPlayer.position.x >= 125: #quando jogador alcanca a posição da eli ele se torna visivel
		$Control.visible = true #visivel
	
	if $protagonistaPlayer.position.x >= 640: #se protagonista sair da tela trocar para a prxima cena (APENAS UM TEXTE)
		get_tree().change_scene("res://cenas/cena_2.tscn")#trocar para cena 2
	
#	if $protagonistaPlayer.position.x >130:
		
		
		
		

		




	
