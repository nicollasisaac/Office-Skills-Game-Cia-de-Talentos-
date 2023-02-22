extends Node

# Variáveis e funções globais

# Cena 1
var bloqueio = true
var movimento_2_eli = false

func bloquear_movimentos():
	bloqueio = true

func desbloquear_movimentos():
	bloqueio = false

func acionar_movimento_eli():
	movimento_2_eli = true

# Fase 1
var final_dialogo = false

func final_dialogo1():
	final_dialogo = true
	
var step2_eli = false
var dialog2 = false
