extends GameUtilities

@onready var GameManager = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	
	if Input.is_action_just_pressed("Bouton HautGauche P1"):
		p1_win = false
	
	if game_finished:
		connect("end_game", _on_end_game)

func _on_end_game(player1_win: bool):
	GameManager.MinigameResults(player1_win)
