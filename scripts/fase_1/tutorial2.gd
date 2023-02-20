extends Control

# Referência ao AnimationPlayer
var animation_player = null

#ao clicar os botões aarecer o tutorial do mesmo.
func _process(delta): 
	if Input.is_action_just_pressed("ui_up"):
		animation_player = get_node("botcima/cimaAnim")
		animation_player.play("pressCima")
		$textTutorial.text = "Utilize este botão para mover-se para cima."
	if Input.is_action_just_pressed("ui_down"):
		animation_player = get_node("botbaixo/baixoAnim")
		animation_player.play("pressBaixo")
		$textTutorial.text = "Utilize este botão para mover-se para baixo."
