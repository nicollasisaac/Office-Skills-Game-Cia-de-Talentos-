extends KinematicBody2D

#var target_position = Vector2(-600, 0)
#var step = 1 # Etapa atual do movimento
#var velocity = Vector2() # Velocidade atual do NPC
#var speed = 50 # Velocidade de movimento do NPC
#var animation_player = null # Referência ao AnimationPlayer
#
#func _ready():
#	animation_player = get_node("RafaProtagonista/AnimationPlayer")
#	if not animation_player:
#		print("AnimationPlayer não encontrado")
#
#func _physics_process(delta):
#	# Calcular a direção do movimento
#	var direction = Vector2()
#	if step == 1:
#		direction = Vector2(target_position.x - position.x, 0)
#		if abs(direction.x) < speed * delta:
#			step = 2
#			direction.x = 0
#	elif step == 2:
#		direction = Vector2(0, target_position.y - position.y)
#		if abs(direction.y) < speed * delta:
#			direction.y = 0
#			velocity = Vector2()
#
#	# Normalizar a direção para obter a velocidade
#	velocity = direction.normalized() * speed
#
#	# Executar o movimento com move_and_slide
#	move_and_slide(velocity, Vector2(0, -1))
#
#	# Definir a animação de acordo com a direção
#	if velocity.x < 0:
#		animation_player.play("andarembora")
		
	
