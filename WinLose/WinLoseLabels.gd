extends Node
# anthony is here!

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Winning Label".hide()
	$"Lose Label".hide()

func _input(event):
	if(event.is_action_released("ui_accept")):
		get_tree().reload_current_scene()

func _on_win():
	$"Winning Label".show()		

func _on_lost():
	$"Lose Label".show()



#func _on_godot_win():
	#pass # Replace with function body.
#
#
#func _on_godot_lost():
	#pass # Replace with function body.


func _on_godot_lost():
	pass # Replace with function body.
