extends Sprite2D

var diced = false
var diceValue
var diceTime =0
var timeElapsed = 0
var timeSinceLastRefresh = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeElapsed = timeElapsed + delta
	
	if diced:
		if timeElapsed < diceTime:
			timeSinceLastRefresh= timeSinceLastRefresh + delta
			if timeSinceLastRefresh >=0.03:  # so we do not do this all the time
				frame = randi()%6
				timeSinceLastRefresh = 0
				
		else:
			diced = false
			frame = diceValue
			timeSinceLastRefresh =0
			timeElapsed = 0
	else:
		#timeSinceLastRefresh = 0		 
		#timeElapsed =0
		pass
	pass


func _on_godot_roll_the_dice():
	pass # Replace with function body.


func _on_roll_the_dice():
	rollDice()
	
	pass # Replace with function body.

func rollDice():
	if diced:
		return
		
	diceValue = randi() % 6
	frame = diceValue
	#$DiceButton.disabled = true
	diced = true
	#tempElapsed = 0
	#diceMovement = 0
	
	var diceType = randi() % 4
	if diceType == 0:
		diceTime = 1.3
		#diceTime = 2	
		$DiceMusic1.play()
	if diceType == 1:
		diceTime = 1.1
		#diceTime = 2
		$DiceMusic2.play()
	if diceType == 2:
		diceTime = 1.5
		#diceTime =3
		$DiceMusic3.play()
	if diceType == 3:
		diceTime = 1.2
		#diceTime = 2.5
		$DiceMusic4.play()


func _on_dice_button_pressed():
	rollDice()
	pass # Replace with function body.
