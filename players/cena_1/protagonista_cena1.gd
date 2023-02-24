extends KinematicBody2D

# "speed" é a velocidade do personagem, e speedauto é a velocidade da animação do personagem
var speedauto = 50
var speed = 115

# Velocity é uma variável que armazena a velocidade atual do objeto na direção x 
var velocity = Vector2()

# Posição alvo final do NPC
var target_position = Vector2(130, 286) 

# Etapa atual do movimento
var step = 1 

# Referência ao AnimationPlayer
var animation_player = null 

# Utilizada para falar que ele chegou na eli e ativar a animação
var chegou = false

# Utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo. 
var troca = false 

func _ready():
	Global.desbloquear_movimentos()
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
	velocity.x = 0
	if not Global.bloqueio:
		if Input.is_action_pressed("move_right") and chegou == true: 
			velocity.x += speed
			troca = true 
		if Input.is_action_pressed("move_left") and chegou == true: 
			velocity.x -= speed
			troca = true 
		if Input.is_action_pressed("ui_up") and chegou == true: 
			velocity.y -= speed
			troca = true 
		if Input.is_action_pressed("ui_down") and chegou == true: #mover baixo
			velocity.y += speed
			troca = true
  
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _set_animation():
# set_animationpermite é uma função para controlar as animações, isto inclui configurar a velocidade, pausar ou continuar a animação.
	var anim = "idle"
	
	if chegou == true: 
		anim = "idlecima"
	
	if troca == true: 
		anim = "idle"
	
	if velocity.x > 0: 
		anim = "andandoladod"
	elif velocity.x < 0: 
		anim = "andandoladoe"
	elif velocity.y < 0:
		anim = "andandocima"
	elif velocity.y > 0:
		anim = "andandobaixo"
		
	if step == 1: 
		anim = "andandoladod"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
