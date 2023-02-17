extends KinematicBody2D

var speedauto = 50
var speed = 115
# "speed" é uma variável inteira que armazena a velocidade do player em pixels por segundo
var velocity = Vector2()
# "velocity" é uma variável que armazena a velocidade atual do objeto na direção x 


var target_position = Vector2(130, 286) # Posição alvo final do NPC
var step = 1 # Etapa atual do movimento
var animation_player = null # Referência ao AnimationPlayer
var chegou = false #utilizada para falar que ele chegou na eli e ativar a animação da linha 61 de olhar para cima
var troca = false #utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.

func _ready():
	animation_player = get_node("anim")
	if not animation_player:
		print("AnimationPlayer não encontrado")

func _physics_process(delta):
# "_physics_process" é uma função responsável por atualizar a movimentação do personagem 
	_update_movement(delta)
	_set_animation()
	
	var posicao_cima = $sprite.position.x
	
	# Calcular a direção do movimento
	var direction = Vector2()
	if step == 1:
		direction = Vector2(target_position.x - position.x, 0)
		if abs(direction.x) < speedauto * delta:
			step = 2
			direction.x = 0
			chegou = true #utilizada para falar que ele chegou na eli e ativar a animação da linha 61 de olhar para cima

	# Normalizar a direção para obter a velocidade
	velocity = direction.normalized() * speedauto

	# Executar o movimento com move_and_slide
	move_and_slide(velocity, Vector2(0, -1))
		
	
func _update_movement(delta):
# _update_movemento é uma função que atualiza a velocidade do personagem de acordo com a entrada do jogador (se eles estão pressionando "move_right" ou "move_left")
	velocity.x = 0
	if Input.is_action_pressed("move_right") and chegou == true: #moverdireita
		velocity.x += speed
		troca = true #utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.
	if Input.is_action_pressed("move_left") and chegou == true: #mover esquerda
		velocity.x -= speed
		troca = true ##utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.
	if Input.is_action_pressed("ui_up") and chegou == true: #mover cima
		velocity.y -= speed
		troca = true #utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.
	if Input.is_action_pressed("ui_down") and chegou == true: #mover baixo
		velocity.y += speed
		troca = true ##utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.

		
	velocity = move_and_slide(velocity, Vector2(0, -1))
	

func _set_animation():
#set_animationpermite é uma função para controlar as animações, isto inclui configurar a velocidade, pausar ou continuar a animação.
	var anim = "idle"
	
	if chegou == true: #chegou na eli entao olhara para cima
		anim = "idlecima"
	
	if troca == true: #saiu da eli entao idle volta a ser para baixo
		anim = "idle"
	
	if velocity.x > 0: #se estiver se movimentando para direita ativara a animação
		anim = "andandoladod"
	elif velocity.x < 0: #se estiver se movimentando para a esquerda ativara a animação
		anim = "andandoladoe"
	elif velocity.y < 0:
		anim = "andandocima"
	elif velocity.y > 0:
		anim = "andandobaixo"
		
	if step == 1: #quando ele estiver se movimentando sozinhono inicio ativara a animação
		anim = "andandoladod"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
