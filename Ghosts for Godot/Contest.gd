extends Node2D


onready var tween = $Tween
var begin = Vector2(.01, .01)
var end = scale

func _process(delta):
	if Input.is_action_just_pressed("click"):
		blam()
func blam():
	tween.interpolate_property(self, "scale", begin, end, 5, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	tween.start()
	
