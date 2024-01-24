extends Area2D

var score: int = 0
var MAX_SCORE = 10

signal win

func _input_event(viewport, event, shape_idx):
	#print(event)
	if (event.is_action_pressed("click")):
		score = score +1
		print(score)
		if (score == MAX_SCORE):
			self.hide()
			emit_signal("win")
		
	
# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
