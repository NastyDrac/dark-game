extends AnimatedSprite

var Player 



func _on_Area2D_area_entered(area):
	if area.get_name() == "Player":
		Player = area.get_parent()
		
	if area.get_name() == "Player" and Global.hasKey == true:
		Global.callScene("res://youWin.tscn")
	elif area.get_name() == "Player" and Global.hasKey == false:
		Player.welcome("I'll need to find the keys first.")
