extends KinematicBody2D

var target_position = Vector2(302, 222) # Posição alvo final do NPC
var step = 1 # Etapa atual do movimento
var velocity = Vector2() # Velocidade atual do NPC
var speed = 60 # Velocidade de movimento do NPC
var animation_player = null # Referência ao AnimationPlayer
var chegou = false

func _ready():
	animation_player = get_node("anim")
	if not animation_player:
		print("AnimationPlayer não encontrado")
	
func _physics_process(delta):
	# Calcular a direção do movimento
	var direction = Vector2()
	if step == 1:
		direction = Vector2(216 - position.x, 0)
		if abs(direction.x) < speed * delta:
			position.x = 216 # Parar no x = 214
			step = 2

	elif step == 2:
		direction = Vector2(0, 302 - position.y)
		if abs(direction.y) < speed * delta:
			position.y = 302 # Parar no y = 302
			step = 3

	elif step == 3:
		direction = Vector2(286 - position.x, 0)
		if abs(direction.x) < speed * delta:
			position.x = 286 # Parar no x = 214
			step = 4
			
	elif step == 4:
		direction = Vector2(302 - position.x, 0)
		if abs(direction.x) < speed * delta:
			position.x = 302 # Parar no x = 302
			step = 5
			
	elif step == 5:
		direction = Vector2(0, 222 - position.y)
		if abs(direction.y) < speed * delta:
			position.y = 222 # Parar no y = 222
			chegou = true

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

