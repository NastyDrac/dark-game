extends Sprite


onready var animate = $AnimationPlayer
onready var audio = $AudioStreamPlayer
onready var sound = preload("res://Sounds/Suspenseful Anvils.wav")

func _ready():
	animate.play("drive")
	audio.stream = sound
	audio.play(3.6)

func _on_AudioStreamPlayer_finished():
	audio.play(3.6)
