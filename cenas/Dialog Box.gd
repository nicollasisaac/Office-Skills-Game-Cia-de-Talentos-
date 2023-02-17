extends ColorRect

export var dialogPath = "" #usada para obter o arquivo json que contem o dialogo que precisamos
export(float) var textSpeed = 0.05 #velocidade do texto



var dialog


var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialogo nao achado") #garantir que funçao funcionou
	nextPhrase()
		
	
func _process(delta):
	if Input.is_action_just_pressed("pressed_enter"): #pressione enter para proxima frase
		if finished:
			nextPhrase() #proxima frase
		else:
			$Text.visible_characters = len($Text.text) #se texto nao tiver acabado jogador pode pular o texto pressionando enter.
	
	
func getDialog() -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath), "File path não existe") #ver se texto existe, se nao existir crashar jogo com a mensagem ao lado
	
	f.open(dialogPath, File.READ) #abre arquivo no caminho do dialogo
	var json = f.get_as_text() #obtem os dados dentro do arquivo em formato de texto
	
	var output = parse_json(json) #transformar  texto e uma variavel utilizavel(nesse caso uma matriz)
	
	if typeof(output) == TYPE_ARRAY: #checar se output é uma matriz senao resultara em um erro
		return output
	else:
		return[]
		
func nextPhrase() -> void:
	if phraseNum >= len(dialog): #se comrimento for >= ao comprimento do dialogo exclua caixa de dialogo e retorne.
		queue_free()
		return
	
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start() #começa a funcao
		yield($Timer,"timeout") #roda funcao ate que o "timeout" seja emitido
	
	finished= true
	phraseNum += 1
	return
	
