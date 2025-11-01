extends Node2D

var GameManager = get_parent()
var P1_ready : bool = false
var P2_ready : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	P1_ready = false
	P2_ready = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if P1_ready and P2_ready:
		P1_ready = false
		P2_ready = false
		$Transition.show()
		$"Transition/Timer de transition".start()
		$Transition/AnimationPlayer.play("fondu_entre")
	
	if $Opening.get_playback_position() >= 3.6:
		$Transition.show()
		$Transition/AnimationPlayer.play("fondu_entre")
		
	if $Opening.get_playback_position() >= 3.8:
		$Transition/AnimationPlayer.play("fondu_sortie")
		
	if $Opening.get_playback_position() >= 4.0:
		$Transition.hide()
		$Opening.stop()
		$Music.play()
	
	if $Music.get_playback_position() >= 96.0:
		$Music.stop()
		$Music.play()

func _on_joueur_1_pressed() -> void:
	P1_ready = true


func _on_joueur_2_pressed() -> void:
	P2_ready = true


func _on_timer_de_transition_timeout() -> void:
	GameManager.next(true)
