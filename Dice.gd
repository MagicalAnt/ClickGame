extends Sprite2D

var diced = false
var diceValue
var diceTime =0
var timeElapsed = 0
var timeSinceLastRefresh = 0
var activePlayer 
var leftPlayerScore
var rightPlayerScore
const colorActive = Color("#ffffff")
const colorInactive = Color("#909090")
var round 
const MAX_ROLLING_TIMES = 10
signal diceWin
signal diceLose
signal diceTie

# Called when the node enters the scene tree for the first time.
func _ready():
	activePlayer = $leftPlayer
	round = 0
	leftPlayerScore = 0
	rightPlayerScore = 0

	_handActiveInactive() 
	pass # Replace with function body.

func _handActiveInactive():

	if round%2 ==0:
		activePlayer = $leftPlayer
		$leftPlayer.modulate = colorActive
		$leftArrow.modulate = colorActive
		$leftScoreLabel.modulate = colorActive
		$rightPlayer.modulate = colorInactive
		$rightArrow.modulate = colorInactive
		$rightScoreLabel.modulate = colorInactive
		if diceValue != null: # add last time dice value
			rightPlayerScore = rightPlayerScore + diceValue+1
	else:
		activePlayer = $rightPlayer
		$leftPlayer.modulate = colorInactive
		$leftArrow.modulate = colorInactive
		$leftScoreLabel.modulate = colorInactive
		$rightPlayer.modulate = colorActive
		$rightArrow.modulate = colorActive
		$rightScoreLabel.modulate = colorActive
		if diceValue != null: # add last time dice value
			leftPlayerScore = leftPlayerScore + diceValue+1
	$leftScore.text = str(leftPlayerScore)
	$rightScore.text = str(rightPlayerScore)
	pass

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





func rollDice():
	if diced:
		return
	if (round >= MAX_ROLLING_TIMES):
		#OS.alert('Rounds complete', 'Information')
		$"DiceButton".disabled = true
		if (leftPlayerScore > rightPlayerScore):
			emit_signal("diceWin")
		elif (leftPlayerScore < rightPlayerScore):
			emit_signal("diceLose")
		else:
			emit_signal("diceTie")
		return
			
		
	diceValue = randi() % 6
	frame = diceValue
	#$DiceButton.disabled = true
	var rnd = round/2
	$roundLabel.text = "Round "+  str(rnd+1)
	round = round +1
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
	
	if (round<MAX_ROLLING_TIMES):
		_handActiveInactive()
	pass
	


func _on_dice_button_pressed():
	rollDice()
	pass # Replace with function body.
