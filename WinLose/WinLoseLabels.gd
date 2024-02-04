extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Winning Label".hide()
	$"Lose Label".hide()
	$"Tie Label".hide()

func _input(event):
	if(event.is_action_released("ui_accept")):
		get_tree().reload_current_scene()

func _on_win():
	$"Winning Label".show()	
	pass	

func _on_lost():
	$"Lose Label".show()
	pass

func _on_dice_win():
	$"Winning Label".show()
	pass # Replace with function body.


func _on_dice_tie():
	$"Tie Label".show()
	pass # Replace with function body.


func _on_godot_win():
	OS.alert("Hahaha, now let us play a dice game!", "Roll it!")
	pass # Replace with function body.
