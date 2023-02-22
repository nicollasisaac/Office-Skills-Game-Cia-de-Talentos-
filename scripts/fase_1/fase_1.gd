extends Node2D

# Define as variáveis para os nós da cena que serão utilizados
onready var positionRafa = get_node("Personagens/fase1_rafa_protagonista")
onready var icone_mesa_area2d = get_node("cenario/icone_mesa/Area2D")

# Configurações que são executadas logo quando a cena é iniciada
func _ready():
	# Caixa de texto não está visível ao iniciar cena
	$dialogo_1.visible = false 
	icone_mesa_area2d.monitoring = false
	
# Executa a cada quadro renderizado
# warning-ignore:unused_argument
func _process(delta):
	if Global.final_dialogo == false:
		# Se o personagem chegar na posição da cadeira, caixa de texto aparecerá iniciando o diálogo
		if positionRafa.position.x >= 260 && positionRafa.position.y <= 280:
			$dialogo_1.visible = true # Caixa de texto se torna visível
		else:
			$dialogo_1.visible = false	
	
	if Global.final_dialogo == true:
		$cenario/icone_mesa.visible = true
		icone_mesa_area2d.monitoring = true
		Global.final_dialogo = false
	
	if 	Global.final_dialog2 == true:
		$objects_cenario/papel_trabalho1.visible = true
		$dialogo_2.visible = false
		Global.step3_eli = true
		Global.final_dialog2 = false
	
	if Global.decisao1 == true:
		$quest_work.visible = true
		$Personagens/eli_Rh_player.visible = false
		Global.decisao1 = false
	
	if Global.show_dialog3 == true:
		$dialogo_3.visible = true
	
	if Global.show_desicion == true:
		$quest_decision.visible = true
	
# Define as variáveis para os nós da cena que serão utilizados
onready var rafaposition = get_node("Personagens/fase1_rafa_protagonista")
onready var icone_mesa = get_node("cenario/icone_mesa")
onready var dialogo1 = get_node("dialogo_1/Dialog1")

# Chamada quando um corpo entra na Área2D
# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	# Define a visibilidade de objetos específicos da cena
	$objects_cenario/CenarioFase1Objects.visible = true
	Global.bloquear_movimentos()
	icone_mesa.visible = false
	icone_mesa_area2d.monitoring = false
	rafaposition.position.x = 367
	rafaposition.position.y = 266
	Global.step2_eli = true
	$dialogo_2.visible = true

func _on_button_quiz_pressed():
	$quest_work.visible = false
	$objects_cenario/papel_trabalho1.visible = false
	$objects_cenario/papel_trabalho2.visible = true
	Global.npc_thomas_active = true
	Global.dialogo3_thomas = true


func _on_button_quiz2_pressed():
	$quest_decision.visible = false
	$quest_decision/Control.visible = false
	$final_decision.visible = true
