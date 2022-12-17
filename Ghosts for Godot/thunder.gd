extends Node2D


onready var audio = $AudioStreamPlayer
onready var thunder = preload("res://Sounds/thunder_strike_1.ogg")
func play_audio():
	
	audio.stream = thunder
	audio.play(4.13)

func _on_AudioStreamPlayer_finished():
	print("done")
	queue_free()
