extends Node2D


onready var positionRafa = get_node("Personagens/fase1_rafa_protagonista")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
#	if $personagens/fase1_rafa_protagonista.position.x >= 414 && $personagens/fase1_rafa_protagonista.position.y <= -10:
#		Global.bloquear_movimentos()
#		$dialogo_1.visible = true
#	if Global.final_dialogo1():
#		$quest_decision.visible = true
	if Global.final_dialogo1_fase3 == true:
		$quest_decision.visible = true
		$"missão".visible = false
	
	
		
	



func _on_wrong_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true

func _on_right_pressed():
	$quest_decision.visible = false
	$right_decision.visible = true

func _on_next_phase_pressed():
	get_tree().change_scene("res://cenas/fase4_cenas/explicação4.tscn")

func _on_back_phase_pressed():
	get_tree().reload_current_scene()

func _on_back_decision_pressed():
	$quest_decision.visible = true
	$wrong_decision.visible = false



func _on_Area2D_body_entered(body):
	Global.bloquear_movimentos()
	$dialogo_1.visible = true
	$icone_mesa.visible = false
#	$personagens/fase1_rafa_protagonista.position.x = 412
#	$personagens/fase1_rafa_protagonista.position.y = -12
