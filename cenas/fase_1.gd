extends Node2D

func _ready():
	$dialogo_1.visible = false #caixa de texto naoesta visivel ao iniciar cena
		
	
func _process(delta):
	# se o personagem chegar na posição da cadeira, caixa de texto aparecera iniciando o dialogo.
	if $Personagens/protagonistaPlayer.position.x >= 374 and $Personagens/protagonistaPlayer.position.y >= 271:
		$dialogo_1.visible = true #caixa de  textose torna visivel
		
	
	



