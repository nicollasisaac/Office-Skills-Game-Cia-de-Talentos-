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
func _process(delta):
	if Global.final_dialogo == false:
		# Se o personagem chegar na posição da cadeira, caixa de texto aparecerá iniciando o diálogo
		if positionRafa.position.x >= 260 && positionRafa.position.y <= 280:
			$dialogo_1.visible = true # Caixa de texto se torna visível
		else:
			$dialogo_1.visible = false	
	elif Global.final_dialogo == true:
		$cenario/icone_mesa.visible = true
		icone_mesa_area2d.monitoring = true
		Global.final_dialogo = false
	
# Define as variáveis para os nós da cena que serão utilizados
onready var rafaposition = get_node("Personagens/fase1_rafa_protagonista")
onready var icone_mesa = get_node("cenario/icone_mesa")
onready var dialogo1 = get_node("dialogo_1/Dialog1")

# Chamada quando um corpo entra na Área2D
func _on_Area2D_body_entered(body):
	# Define a visibilidade de objetos específicos da cena
	$CenarioFase1Objects.visible = true
	Global.bloquear_movimentos()
	icone_mesa.visible = false
	icone_mesa_area2d.monitoring = false
	rafaposition.position.x = 367
	rafaposition.position.y = 266
	Global.step2_eli = true
	$papel_trabalho.visible = true
	
