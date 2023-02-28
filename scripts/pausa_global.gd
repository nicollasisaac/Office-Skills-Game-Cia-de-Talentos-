extends CanvasLayer

onready var botaoContinuar = $Continuar
onready var botaoReiniciar = $Reiniciar
onready var texRect = $TextureRect

func _ready() -> void:
	botaoContinuar.visible = false
	botaoReiniciar.visible = false
	texRect.visible = false
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("press_tab"): #quando aperta o tab
		get_tree().paused = !get_tree().paused  
		botaoContinuar.visible = !botaoContinuar.visible
		botaoReiniciar.visible = !botaoReiniciar.visible
		texRect.visible = !texRect.visible
	
	pass 

func _on_Continuar_pressed() -> void:
	get_tree().paused = false
	botaoContinuar.visible = false
	botaoReiniciar.visible = false
	texRect.visible = false
	pass # Replace with function body.


func _on_Reiniciar_pressed():
	get_tree().change_scene("res://cenas/tela_inicial.tscn")
	get_tree().paused = false
	botaoContinuar.visible = false
	botaoReiniciar.visible = false
	texRect.visible = false
	pass # Replace with function body.
