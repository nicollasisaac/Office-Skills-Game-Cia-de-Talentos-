extends KinematicBody2D

 # Posição alvo final do NPC
var target_position = Vector2(130, 286)
var target_position2 = Vector2(685, 320)

# Step é a etapa atual da animação do movimento
var step = 1 

# Velocidade atual do NPC
var velocity = Vector2() 

# Velocidade de movimento do NPC
var speed = 100

# Referência ao AnimationPlayer
var animation_player = null 
var chegou = false

func _ready():
	# Pegar o node da animação do personagem 
	animation_player = get_node("anim")
	if not animation_player:
		print("AnimationPlayer não encontrado")

func _process(delta):
	# Se o movimento da eli for acionado depois do dialogo, ela fará a 3 etapa da animação
	if Global.movimento_2_eli == true:
		step = 3 
	
func _physics_process(delta):
	# Calcular a direção do movimento
	var direction = Vector2()
	
	# Etapas de animação
	if step == 1:
		direction = Vector2(target_position.x - position.x, 0)
		if abs(direction.x) < speed * delta:
			step = 2
			direction.x = 0
	if step == 2:
		direction = Vector2(0, target_position.y - position.y)
		if abs(direction.y) < speed * delta:
			direction.y = 0
			velocity = Vector2()
			chegou = true
	if step == 3:
		direction = Vector2(0, target_position2.y - position.y)
		if abs(direction.y) < speed * delta:
			if chegou:
				step = 4
				direction = Vector2(target_position2.x - position.x, 0)
			else:
				step = 4
				direction = Vector2(target_position2.x - position.x, 0)
	if step == 4:
		direction = Vector2(target_position2.x - position.x, 0)
		if abs(direction.x) < speed * delta:
			chegou = true
			direction.x = 0

	# Normalizar a direção para obter a velocidade
	velocity = direction.normalized() * speed

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
		animation_player.play("idle")
