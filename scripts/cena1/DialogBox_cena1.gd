extends ColorRect

# Define a variável dialogPath que será usada para obter o arquivo JSON que contém o diálogo que precisamos
export var dialogPath = ""
# Define a velocidade do texto que será usada
export(float) var textSpeed = 0.05

# Define as variáveis dialog, phraseNum e finished
var dialog
var phraseNum = 0
var finished = false

func _ready():
	# Define o tempo de espera do timer com a velocidade do texto
	$Timer.wait_time = textSpeed
	# Obtém o diálogo
	dialog = getDialog()
	# Garante que a função getDialog funcionou
	assert(dialog, "Dialogo nao achado")
	# Inicia a próxima frase
	nextPhrase()

func _process(delta):
	# Se o botão "Enter" for pressionado, vá para a próxima frase ou termine a atual
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
		else:
			# Se o texto ainda não tiver acabado, o jogador pode pular o texto pressionando "Enter"
			$Text.visible_characters = len($Text.text)

func getDialog() -> Array:
	# Cria um objeto do tipo File
	var f = File.new()
	# Verifica se o arquivo de diálogo existe; se não existir, o jogo será encerrado e a mensagem ao lado será exibida
	assert(f.file_exists(dialogPath), "File path não existe")
	# Abre o arquivo no caminho do diálogo
	f.open(dialogPath, File.READ)
	# Obtém o conteúdo do arquivo em formato de texto
	var json = f.get_as_text()
	# Converte o conteúdo do arquivo em uma variável utilizável (neste caso, uma matriz)
	var output = parse_json(json)
	# Verifica se a variável de saída é uma matriz; se não for, retorna uma matriz vazia
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func nextPhrase() -> void:
	Global.bloquear_movimentos()
	# Se o número de frases for maior ou igual ao comprimento do diálogo, exclui a caixa de diálogo e retorna
	if phraseNum >= len(dialog):
		queue_free()
		Global.desbloquear_movimentos()
		Global.acionar_movimento_eli()
		return
	# Define a variável finished como falsa
	finished = false
	# Define o texto do nome e do texto da caixa de diálogo
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	# Define o número de caracteres visíveis como zero
	$Text.visible_characters = 0
	# Enquanto o número de caracteres visíveis for menor do que o comprimento do texto, aumenta o número de caracteres visíveis em 1
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		# Inicia o timer
		$Timer.start()
		# Pausa a função até que o "timeout" seja emitido
		yield($Timer,"timeout")
	# Define a variável finished como verdadeira, aumenta o número de frases em 1 e retorna
	finished= true
	phraseNum += 1
	return
