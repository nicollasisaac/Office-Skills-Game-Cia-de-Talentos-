extends KinematicBody2D

# 'speedauto' é a variavel que armazena a velocidade do movimento pré-definido dos personagens. 
var speedauto = 80

# "velocity" é uma variável que armazena a velocidade atual do objeto na direção x 
var velocity = Vector2()

# Etapa atual do movimento
var step = 0

# Referência ao AnimationPlayer
var animation_player = null 

# Chamar animação.
func _ready():
	animation_player = get_node("anim")
	if not animation_player:
		print("AnimationPlayer não encontrado")

#Função para a movimentação do personagem.
func _physics_process(delta):
	_set_animation()
	if Global.npc_thomas_active == true:
		step = 1
		Global.npc_thomas_active = false
		
	# Calcular a direção do movimento baseada no passo("step") atual.
	var direction = Vector2()
	
	if step == 1:
		direction = Vector2(213 - position.x, 0)
		if abs(direction.x) < speedauto * delta:
			direction.x = 213
			step = 2
			
	if step == 2:
		direction = Vector2(0, 302 - position.y)
		if abs(direction.y) < speedauto * delta:
			position.y = 302 # Parar no y = 302
			step = 3

	if step == 3:
		direction = Vector2(286 - position.x, 0)
		if abs(direction.x) < speedauto * delta:
			position.x = 286 # Parar no x = 214
			step = 4
	
	if step == 4:
		direction = Vector2(0, 260 - position.y)
		if abs(direction.y) < speedauto * delta:
			position.y = 260 # Parar no x = 214
			Global.show_dialog3 = true
			step = 5
			
	if step == 5 && Global.show_dialog3 == false:
		direction = Vector2(0, 302 - position.y)
		if abs(direction.y) < speedauto * delta:
			position.y = 302 # Parar no x = 214
			Global.show_dialog3 = true
			step = 6
	
	if step == 6:
		direction = Vector2(213 - position.x, 0)
		if abs(direction.x) < speedauto * delta:
			position.x = 213 # Parar no x = 214
			step = 7
	
	if step == 7:
		direction = Vector2(0, 150 - position.y)
		if abs(direction.y) < speedauto * delta:
			position.y = 150 # Parar no x = 214
			step = 8
	
	if step == 8:
		direction = Vector2(655 - position.x, 0)
		if abs(direction.x) < speedauto * delta:
			position.x = 655 # Parar no x = 214
			Global.show_desicion = true
			step = 0

	# Normalizar a direção para obter a velocidade
	velocity = direction.normalized() * speedauto

	# Executar o movimento com move_and_slide
	move_and_slide(velocity, Vector2(0, -1))


func _set_animation():
	var anim = "idle"
	
	#Ativar devidas animações durante movimentação do personagem.
	if velocity.x > 0: 
		anim = "andandoladod"
	elif velocity.x < 0: 
		anim = "andandoladoe"
	elif velocity.y < 0:
		anim = "andandocima"
	elif velocity.y > 0:
		anim = "andandobaixo"
	else:
		anim = "idle"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
