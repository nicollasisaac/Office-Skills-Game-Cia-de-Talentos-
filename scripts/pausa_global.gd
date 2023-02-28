extends CanvasLayer

onready var botaoContinuar = $Continuar #botão continuar
onready var botaoReiniciar = $Reiniciar #botão reiniciar
onready var texRect = $TextureRect #textura transparente

func _ready() -> void:
# Configurações que são executadas logo quando a cena é iniciada / Configs executed as soon as scene starts.
	botaoContinuar.visible = false
	botaoReiniciar.visible = false
	texRect.visible = false
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("press_tab"): #quando aperta o tab
		get_tree().paused = !get_tree().paused 
		#o jogo pausa 
		botaoContinuar.visible = !botaoContinuar.visible
		botaoReiniciar.visible = !botaoReiniciar.visible
		texRect.visible = !texRect.visible
		#os botões e a textura aparecem
	
	pass 

func _on_Continuar_pressed() -> void: 
#se o continuar for apertado
	get_tree().paused = false
	#o jogo sai do pause
	botaoContinuar.visible = false
	#o continuar sai da tela
	botaoReiniciar.visible = false
	#o reiniciar sai da tela
	texRect.visible = false
	#a textura sai da tela
	pass # Replace with function body.


func _on_Reiniciar_pressed():
#se o reiniciar for apertado
	get_tree().change_scene("res://cenas/tela_inicial.tscn")
	#aparece a tela inicial
	get_tree().paused = false
	#o jogo sai do pause
	botaoContinuar.visible = false
	#o continuar sai da tela
	botaoReiniciar.visible = false
	#o reiniciar sai da tela
	texRect.visible = false
	#a textura sai da tela
	pass # Replace with function body.
