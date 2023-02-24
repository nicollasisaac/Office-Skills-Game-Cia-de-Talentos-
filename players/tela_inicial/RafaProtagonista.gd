extends Sprite

var animation_player = null

# 
func _ready():
	animation_player = get_node("AnimationPlayer")
	animation_player.play("olharlados")


