extends AudioStreamPlayer2D


onready var sound = preload("res://Sounds/Low Dissonant Growling(1).wav")


func play_audio():
	stream = sound
	play()


func _on_GhostClose_finished():
	get_parent().warned = false
	queue_free()
