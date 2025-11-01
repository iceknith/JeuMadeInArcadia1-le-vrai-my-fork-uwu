extends Node

# LISTE DES MINIJEUX DU JEU
var Minijeux = []
var dir = DirAccess.open("res://Minigames")

# ETAT DE LA PARTIE
var Etat = ""

func _init() -> void:
	var folders = dir.get_directories()
	
	for folder in folders:
		dir = DirAccess.open("res://Minigames/" + folder)
		var files = dir.get_files()
		if Array(files) != []:
			var scene = ""
			var preview_image = ""
			#RECHERCHE DU JEU ET DE L'IMAGE
			for file in dir.get_files():
				if ".tscn" in file:
					scene = file
				if (".jpg" in file and not ".jpg." in file) or (".png" in file and not ".png." in file):
					preview_image = file
			#VERFICATION DES ELEMENTS DEMANDES
			if scene != "" and preview_image != "":
				Minijeux.append([scene,load("res://Minigames/" + folder + "/" + preview_image),folder])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var MJ_disponibles = Minijeux
	
	var scene = load("res://ecran_titre.tscn")
	var instance = scene.instantiate()
	add_child(instance)

func next(conditions) -> void:
	if conditions:
		if Etat == "" or Etat == "FinJeu":
			# RETOUR AU MENU
			var scene = load("res://ecran_titre.tscn")
			var instance = scene.instantiate()
			add_child(instance)
			
			# CHANGEMENT D'ETAT
			Etat = "Menu"
		
		elif Etat == "Menu":
			# RETOUR AU MENU
			var scene = load("res://ecran_de_selection.tscn")
			var instance = scene.instantiate()
			add_child(instance)
			
			# CHANGEMENT D'ETAT
			Etat = "Selection"

func minigame_selected(minigame) -> void:
	pass
