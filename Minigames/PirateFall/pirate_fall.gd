extends GameUtilities

@onready var GameManager = get_parent()

func _ready() -> void:
	super()
	# On peut connecter le end_game directement ici !
	connect("end_game", _on_end_game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	
	if Input.is_action_just_pressed("Bouton HautGauche P1"):
		p1_win = false
	
	# ALors, ça c'est pas super super
	# Globalement, un signal tu va essayer de le connecter au début du programme,
	# Là tu fait ce check chaque frame
	# Alors que, par définition un signal va juste executer ta fonction dès que le jeu est fini
	#if game_finished:
	#	connect("end_game", _on_end_game)

func _on_end_game(player1_win: bool):
	# Au final ça fait pas grand chose, mais tkt ^^
	print("partie finie")
	#GameManager.MinigameResults(player1_win)
