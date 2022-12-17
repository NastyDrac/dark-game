extends Node2D
onready var Player = $Player/Player
onready var hidden = []
var found
func _ready():
	
	if Global.entered <= 0:
		randomize()
		found = round(rand_range(1,3))
		print(found)
	


func _on_Area2D_area_entered(area):

	if found == 1 and Global.hasKey == false:
		Player.welcome("I found the key")
		Global.hasKey = true
	else:
		Player.welcome("Hmm, the key isn't here.")

func _on_Area2D3_area_entered(area):
	
	if found == 3 and Global.hasKey == false:
		Player.welcome("I found the key")
		Global.hasKey = true
	else:
		Player.welcome("Hmm, the key isn't here.")

func _on_Area2D2_area_entered(area):

	if found == 2 and Global.hasKey == false:
		Player.welcome("I found the key")
		Global.hasKey = true
	else:
		Player.welcome("Hmm, the key isn't here.")
