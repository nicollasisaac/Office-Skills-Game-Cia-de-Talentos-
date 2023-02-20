extends Node

#variaveis e funções globais da cena1
var bloqueio = true
var movimento_2_eli = false

func bloquear_movimentos():
	bloqueio = true

func desbloquear_movimentos():
	bloqueio = false

func acionar_movimento_eli():
	movimento_2_eli = true
