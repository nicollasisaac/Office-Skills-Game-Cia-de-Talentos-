extends KinematicBody2D

# 'speedauto' é a variavel que armazena a velocidade do movimento pré-definido dos personagens. 
var speedauto = 50

# "speed" é uma variável inteira que armazena a velocidade do player em pixels por segundo
var speed = 100

# "velocity" é uma variável que armazena a velocidade atual do objeto na direção x 
var velocity = Vector2()

# Posição alvo final do NPC
var target_position = Vector2(136, 177) 

# Etapa atual do movimento
var step = 1

# Referência ao AnimationPlayer
var animation_player = null 

#utilizada para falar que ele chegou na eli e ativar a animação da linha 61 de olhar para cima
var arrived = false 

#utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.
var change = false 

#Liberar movimentos do jogador e chamar animações.
func _ready():
	Global.desbloquear_movimentos()
	animation_player = get_node("anim")
	if not animation_player:
		print("AnimationPlayer não encontrado")

# "_physics_process" é uma função responsável por atualizar a movimentação do personagem 
func _physics_process(delta):
	_update_movement()
	_set_animation()
	
	# Calcular a direção do movimento
	var direction = Vector2()
	if step == 1:
		direction = Vector2(target_position.x - position.x, 0)
		if abs(direction.x) < speedauto * delta:
			step = 2
			direction.x = 0
			arrived = true 
			#utilizada para falar que ele chegou na eli e ativar a animação da linha 61 de olhar para cima

	# Normalizar a direção para obter a velocidade
	velocity = direction.normalized() * speedauto

	# Executar o movimento com move_and_slide
	move_and_slide(velocity, Vector2(0, -1))

func _update_movement():
	velocity.x = 0
	if not Global.bloqueio:
		#moverdireita
		if Input.is_action_pressed("move_right") and arrived == true: 
			velocity.x += speed
			change = true
			#utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo. 
		#mover esquerda
		if Input.is_action_pressed("move_left") and arrived == true: 
			velocity.x -= speed
			change = true
			#utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.
		#mover cima
			velocity.y -= speed
		if Input.is_action_pressed("ui_up") and arrived == true: 
			change = true 
			#utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.
		#mover baixo
		if Input.is_action_pressed("ui_down") and arrived == true: 
			velocity.y += speed
			change = true 
			#utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo.
  
	velocity = move_and_slide(velocity, Vector2(0, -1))

#set_animationpermite é uma função para controlar as animações, isto inclui configurar a velocidade, pausar ou continuar a animação.
func _set_animation():
	
	#Variável de animação.
	var anim = "idle"
	
	#Quando personagem chegar na eli animação de olhar para cima.
	if position.x >= 260: 
		anim = "idlecima"
	else:
		anim = "idle"
	
	#Ativar devidas animações durante movimentação do personagem.
	if velocity.x > 0: 
		anim = "andandoladod"
	elif velocity.x < 0: 
		anim = "andandoladoe"
	elif velocity.y < 0:
		anim = "andandocima"
	elif velocity.y > 0:
		anim = "andandobaixo"
	
	#Ativar movimentação durante movimento automático no inicio da fase.
	if step == 1:
		anim = "andandoladod"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)

