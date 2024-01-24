extends Area2D

var random = RandomNumberGenerator.new()
#var randX = random.randi_range(20,100)
#var randY = random.randi_range(20,100)

var score: int = 0
var MAX_SCORE = 10

signal win
signal lost

func _ready():
	_rand_position()

func _input_event(viewport, event, shape_idx):
	#print(event)
	if (event.is_action_pressed("click")):
		score = score +1
		_rand_position()
		print(score)
		if (score == MAX_SCORE):
			self.hide()
			emit_signal("win")
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
	var randX = random.randi_range(20,get_viewport_rect().size.x -20)
	var randY = random.randi_range(20,get_viewport_rect().size.y - 20)
	self.set_global_position(Vector2(randX, randY))
	
