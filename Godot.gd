extends Area2D

var random = RandomNumberGenerator.new()
#var randX = random.randi_range(20,100)
#var randY = random.randi_range(20,100)

var score: int = 0
var MAX_SCORE = 5

signal win
signal lost

func _ready():
	_rand_position()

func _input_event(viewport, event, shape_idx):
	#print(event)
	#if (event.is_action_pressed("click") and $"AnimatedSprite2D".get_animation() == "idle"):
	if (event.is_action_pressed("click") and $"AnimatedSprite2D".get_animation() == "idle"):
		$"AnimatedSprite2D".play("hurt")
		score = score +1
		if (score < MAX_SCORE):
			$"AnimationPlayer".play("Teleport")
		#_rand_position()
		#print("Animaiton is: " + $"AnimatedSprite2D".get_animation())
		if (score == MAX_SCORE):
			$"Timer".stop()
		
	
# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_timer_timeout():
	emit_signal("lost")
	self.hide()
#	pass # Replace with function body.

func _rand_position():
	random.randomize()
	var randX = random.randi_range(20,get_viewport_rect().size.x -50)
	var randY = random.randi_range(20,get_viewport_rect().size.y - 50)
	self.set_global_position(Vector2(randX, randY))
	


func _on_animated_sprite_2d_animation_finished():
	if($"AnimatedSprite2D".get_animation() == "hurt"):
		if (score ==MAX_SCORE):
			$"AnimatedSprite2D".play("death")
			#$"Timer".stop()
			emit_signal("win")
			
	#elif ($"AnimatedSprite2D".get_animation() == "death"):
		#$"AnimatedSprite2D".play("idle")



func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "Teleport" and $"AnimatedSprite2D".get_animation() == "hurt"):
			_rand_position()
			$"AnimatedSprite2D".play("idle")
			$"AnimationPlayer".play("Teleport", -1,-1, true)

