class_name GameUtilities extends Node

signal end_game(player1_win:bool)

@export_category("Timers")
@export var regle : float = 5.0
@export var jeu : float = 90.0
@export var fin : float = 2.0

var timer_regle : Timer
var timer_jeu : Timer
var timer_fin : Timer

var label : Label

var p1_win = true
var game_started = false
var game_finished = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_started = false
	game_finished = false
	
	timer_regle = Timer.new()
	timer_jeu = Timer.new()
	timer_fin = Timer.new()

	add_child(timer_regle)
	add_child(timer_jeu)
	add_child(timer_fin)

	timer_regle.wait_time = regle
	timer_jeu.wait_time = jeu
	timer_fin.wait_time = fin

	timer_regle.one_shot = true
	timer_jeu.one_shot = true
	timer_fin.one_shot = true
	
	timer_regle.start()
	print("Voici les règles")
	timer_regle.timeout.connect(regle_timeout)

func _process(delta: float) -> void:
	if game_started:
		$Timer.text = "Temps : " + str(int(timer_jeu.time_left))
	else:
		$Timer.text = "Temps : 90"

# Phase 1: Règle
func regle_timeout() -> void:
	print("A vous de jouer !")
	game_started = true
	timer_jeu.start()
	timer_jeu.timeout.connect(jeu_timeout)

# Phase 2: Jeu
func jeu_timeout() -> void:
	print("FINI")
	timer_fin.start()
	timer_fin.timeout.connect(fin_timeout)

# Phase 3: Fin
func fin_timeout() -> void:
	game_finished = true
	print("tscn")
	end_game.emit(p1_win)
	
