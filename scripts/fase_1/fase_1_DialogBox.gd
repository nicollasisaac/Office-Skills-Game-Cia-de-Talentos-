extends ColorRect

# Usada para obter o arquivo json que contém o diálogo que precisamos
export var dialogPath = ""

# Velocidade do texto
export(float) var textSpeed = 0.05

var dialog
var phraseNum = 0
var finished = false

func _ready():
	# Configurando o tempo de espera do Timer
	$Timer.wait_time = textSpeed
	
	# Obtendo o diálogo do arquivo especificado
	dialog = getDialog()
	
	# Garantindo que o diálogo foi obtido com sucesso
	assert(dialog, "Diálogo não encontrado")
	
	# Exibindo a primeira frase do diálogo
	nextPhrase()
	
func _process(delta):
	# Verificando se o jogador pressionou a tecla "enter"
	if Input.is_action_just_pressed("pressed_enter"):
		if finished:
			nextPhrase() # Exibindo a próxima frase
		else:
			$Text.visible_characters = len($Text.text) # Se o texto ainda não terminou, o jogador pode pular para o fim do diálogo pressionando "enter"
	
	
func getDialog() -> Array:
	var f = File.new()
	
	# Verificando se o arquivo especificado existe
	assert(f.file_exists(dialogPath), "Caminho do arquivo não existe")
	
	# Abrindo o arquivo especificado
	f.open(dialogPath, File.READ)
	
	# Obtendo os dados do arquivo em formato de texto
	var json = f.get_as_text()
	
	# Convertendo o texto em uma variável utilizável (neste caso, uma matriz)
	var output = parse_json(json)
	
	# Verificando se a variável de saída é uma matriz, caso contrário, retornando uma lista vazia
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return[]
		
func nextPhrase() -> void:
	# Verificando se todas as frases do diálogo foram exibidas
	if phraseNum >= len(dialog):
		Global.desbloquear_movimentos()
		Global.final_dialogo1()
		queue_free()
		return
	
	finished = false
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	# Exibindo a frase letra por letra com um tempo de espera
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer,"timeout")
	
	finished= true
	phraseNum += 1
	return
