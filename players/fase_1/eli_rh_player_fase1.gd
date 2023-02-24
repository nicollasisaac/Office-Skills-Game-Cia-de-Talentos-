extends KinematicBody2D

# Posição alvo final do NPC
var target_position = Vector2(302, 250) 

# Etapa atual do movimento
var step = 1 

# Velocidade atual do NPC
var velocity = Vector2() 

# Velocidade de movimento do NPC
var speed = 60 

# Referência ao AnimationPlayer
var animation_player = null 

#Variavel para quando personagem chegar no ponto desejado.
var arrived = false

#Chamando a animação do personagem.
func _ready():
	animation_player = get_node("anim")
	if not animation_player:
		print("AnimationPlayer não encontrado")
	
func _physics_process(delta):
	# Calcular a direção do movimento
	var direction = Vector2()
	
	#Rota pré-definida da personagem Eli.
	if step == 1:
		direction = Vector2(216 - position.x, 0)
		if abs(direction.x) < speed * delta:
			# Parar no x = 214
			position.x = 216 
			step = 2

	if step == 2:
		direction = Vector2(0, 302 - position.y)
		if abs(direction.y) < speed * delta:
			# Parar no y = 302
			position.y = 302 
			step = 3

	if step == 3:
		direction = Vector2(286 - position.x, 0)
		if abs(direction.x) < speed * delta:
			# Parar no x = 214
			position.x = 286 
			step = 4
			
	if step == 4:
		direction = Vector2(302 - position.x, 0)
		if abs(direction.x) < speed * delta:
			# Parar no x = 302
			position.x = 302 
			step = 5
			
	if step == 5:
		direction = Vector2(0, 222 - position.y)
		if abs(direction.y) < speed * delta:
			# Parar no y = 222
			position.y = 222 
			arrived = true
	
	if Global.step2_eli == true:
		direction = Vector2(0, 250 - position.y)
		if abs(direction.y) < speed * delta:
			position.y = 250
			step = 0
			Global.step2_eli = false
	
	if Global.step3_eli == true:
		direction = Vector2(0, 317 - position.y)
		if abs(direction.y) < speed * delta:
			position.y = 317
			step = 6
			Global.step2_eli = false
	
	if step == 6:
		direction = Vector2(70 - position.x, 0)
		if abs(direction.x) < speed * delta:
			position.x = 70
			step = 7
	
	if step == 7:
		direction = Vector2(0, 194 - position.y)
		if abs(direction.y) < speed * delta:
			position.y = 194
			step = 8
	
	if step == 8:
		direction = Vector2(3 - position.x, 0)
		if abs(direction.x) < speed * delta:
			position.x = 3
			Global.decisao1 = true
			step = 0
	

	# Definir a velocidade atual do NPC com base na direção e na velocidade máxima
	velocity = direction.normalized() * speed
	
	# Atualizar a posição do NPC baseado na sua velocidade atual
	position += velocity * delta
		
	# Executar o movimento com move_and_slide
	move_and_slide(velocity, Vector2(0, -1))
	
	# Definir a animação de acordo com a direção
	if velocity.x > 0:
		animation_player.play("andandoladod")
	elif velocity.x < 0:
		animation_player.play("andandoladoe")
	elif velocity.y > 0:
		animation_player.play("andandobaixo")
	elif velocity.y < 0:
		animation_player.play("andandocima")
	else:
		animation_player.play("idleMovendo")

