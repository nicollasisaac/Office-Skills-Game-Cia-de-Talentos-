extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_wrong_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true


func _on_right_pressed():
	$quest_decision.visible = false
	$right_decision.visible = true




func _on_back_phase_pressed():
	get_tree().reload_current_scene()

func _on_back_decision_pressed():
	$quest_decision.visible = true
	$wrong_decision.visible = false

func _on_next_phase_pressed():
	get_tree().change_scene("res://cenas/fase5_cenas/explicação5.tscn")
