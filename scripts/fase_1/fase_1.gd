extends Node2D

# Define as variáveis para os nós da cena que serão utilizados
onready var positionRafa = get_node("Personagens/fase1_rafa_protagonista")
onready var icon_table_area2d = get_node("cenario/icone_mesa/Area2D")

# Configurações que são executadas logo quando a cena é iniciada
onready var http_request = HTTPRequest.new()
onready var video_player = get_node("right_decision/video_conteudo")

func _ready():
	# Caixa de texto não está visível ao iniciar cena
	$dialogo_1.visible = false 
	icon_table_area2d.monitoring = false
	
	# variáveis fase 1 - dialogo
	Global.final_dialogo = false

	# variáveis fase 1 - animação
	Global.step2_eli = false
	Global.step3_eli = false
	Global.npc_thomas_active = false

	# variáveis fase 1 - dialogo
	Global.final_dialogo = false
	Global.final_dialog2 = false
	Global.dialogo3_thomas = false
	Global.show_dialog3 = false
	
# Executa a cada quadro renderizado
func _process(delta):
	if Global.final_dialogo == false:
		# Se o personagem chegar na posição da cadeira, caixa de texto aparecerá iniciando o diálogo
		if positionRafa.position.x >= 260 && positionRafa.position.y <= 280:
			$dialogo_1.visible = true # Caixa de texto se torna visível
		else:
			$dialogo_1.visible = false	
	
	if Global.final_dialogo == true:
		$cenario/icone_mesa.visible = true
		icon_table_area2d.monitoring = true
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
		Global.show_desicion = false
	
# Define as variáveis para os nós da cena que serão utilizados
onready var rafaposition = get_node("Personagens/fase1_rafa_protagonista")
onready var icone_mesa = get_node("cenario/icone_mesa")
onready var dialogo1 = get_node("dialogo_1/Dialog1")

# Chamada quando um corpo entra na Área2D
func _on_Area2D_body_entered(body):
	# Define a visibilidade de objetos específicos da cena
	$objects_cenario/CenarioFase1Objects.visible = true
	Global.bloquear_movimentos()
	rafaposition.position.x = 367
	rafaposition.position.y = 266
	Global.step2_eli = true
	$dialogo_2.visible = true

# Quando a pessoa clicar em "trabalhar" o Thomas aparecerá
func _on_button_quiz_pressed():
	$quest_work.visible = false
	$objects_cenario/papel_trabalho1.visible = false
	$objects_cenario/papel_trabalho2.visible = true
	Global.npc_thomas_active = true
	Global.dialogo3_thomas = true

# Se a pessoa clicar na opção certa o usuário será levado para tela de feedback
func _on_right_pressed():
	$quest_decision.visible = false
	$right_decision.visible = true

# Botão "incorreto pressionado".
func _on_wrong_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true

#Botão de proximafase pressionado. [WIP]
func _on_next_phase_pressed():
	pass 

#Botão de retorno a fase pressionado.
func _on_back_phase_pressed():
	get_tree().reload_current_scene()


func _on_back_decision_pressed():
	$quest_decision.visible = true
	$wrong_decision.visible = false



