extends Node2D

#SELECTION = TEXTURE_RECT4
var Miniature = []
var choiced_array1 = Miniature.pick_random()
var Select = false
var tick : int = 0
var w : float = -985.0
var x : float = -460.0
var y : float = 65.0
var z : float = 590.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Transition/AnimationPlayer.play("fondu_sortie")
	$Selection.start()
	
	$Miniatures/TextureRect4.set_position(Vector2(65,w))
	$Miniatures/TextureRect3.set_position(Vector2(65,x))
	$Miniatures/TextureRect2.set_position(Vector2(65,y))
	$Miniatures/TextureRect.set_position(Vector2(65,z))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not Select:
		if tick > -410:
			
			w += 52.5
			if w >= 1015.0:
				w = -985.0
				choiced_array1 = Miniature.pick_random()
				$Miniatures/TextureRect4.texture = choiced_array1[1]
			$Miniatures/TextureRect4.set_position(Vector2(65,w))
			
			x += 52.5
			if x >= 1015.0:
				x = -985.0
				var choiced_array = Miniature.pick_random()
				$Miniatures/TextureRect3.texture = choiced_array[1]
			$Miniatures/TextureRect3.set_position(Vector2(65,x))
			
			y += 52.5
			if y >= 1015.0:
				y = -985.0
				var choiced_array = Miniature.pick_random()
				$Miniatures/TextureRect2.texture = choiced_array[1]
			$Miniatures/TextureRect2.set_position(Vector2(65,y))
			
			z += 52.5
			if z >= 1015.0:
				z = -985.0
				var choiced_array = Miniature.pick_random()
				$Miniatures/TextureRect.texture = choiced_array[1]
			$Miniatures/TextureRect.set_position(Vector2(65,z))
			
		else:
			Select = true
			
		tick -= 1
		
	if Select:
		if tick < 0:
			tick = 0
			
		if tick < 20:
			if tick < 10:
				w += 5
				x += 5
				y += 5
				z += 5
				
			else:
				w -= 5
				x -= 5
				y -= 5
				z -= 5
				
			$Miniatures/TextureRect4.set_position(Vector2(65,w))
			$Miniatures/TextureRect3.set_position(Vector2(65,x))
			$Miniatures/TextureRect2.set_position(Vector2(65,y))
			$Miniatures/TextureRect.set_position(Vector2(65,z))
			
			tick += 1
		else:
			if tick == 20:
				$Starting.start()
				tick += 1
	

func _on_starting_timeout() -> void:
	$Transition.show()
	$Transition/Timer.start()
	$Transition/AnimationPlayer.play("fondu_entre")


func _on_timer_timeout() -> void:
	queue_free()
	var scene = load("res://Minigames/" + choiced_array1[-1] + "/" + choiced_array1[0])
	get_parent().add_child(scene)
	#get_tree().change_scene_to_file("res://Minigames/" + choiced_array1[-1] + "/" + choiced_array1[0])
