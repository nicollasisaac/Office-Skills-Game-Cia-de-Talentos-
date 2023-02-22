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
var final_dialog2 = false
var step3_eli = false

var decisao1 = false

var npc_thomas_active = false
var dialogo3_thomas = false

var show_dialog3 = false
var show_desicion = false
