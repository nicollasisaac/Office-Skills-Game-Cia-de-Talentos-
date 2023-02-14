extends Node2D

func _ready():
	$KinematicBody2D/RafaProtagonista/AnimationPlayer.play("olharlados")


func _on_botao_enter_pressed():
	get_tree().change_scene("res://cenas/cena_1.tscn")
