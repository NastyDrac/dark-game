extends Node2D
onready var canvas = $CanvasModulate
onready var ghost = preload("res://Ghost.tscn")
onready var audio = $AudioStreamPlayer
onready var anvil = preload("res://Sounds/Suspenseful Anvils.wav")
onready var animate = $AnimationPlayer
onready var Player = $Player/Player
onready var timer = $Timer
onready var lightning = $Lightning
onready var thunder = preload("res://thunder.tscn")
var difficulty = Global.difficulty

var struck = false
func _ready():
	audio.stream = anvil
	audio.play()
	if Global.playerLocation != Vector2():
		Player.position = Global.playerLocation
	if Global.isDark == true:
		canvas.color = "090101"
		spawnGhost(difficulty)
	
	
func startUp():
	Player.welcome("Oh, I must have fallen asleep.  I wonder where everybody went.")
	yield(get_tree().create_timer(4), "timeout")
	animate.play("dark")
	Player.welcome("Looks like it's getting dark.  Good thing I have my flashlight")
	timer.start(rand_range(15, 20))


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == ("dark"):
		Global.isDark = true
		spawnGhost(difficulty)

func spawnGhost(number):
	while number > 0:
		var spawn = Vector2(rand_range(-1000, 2500), rand_range(-400, 2000))
		var newspawn = ghost.instance()
		add_child(newspawn)
		newspawn.position = spawn
		number -= 1


func _on_Timer_timeout():
	if struck == false:
		lightningStrikes()
	elif struck == true:
		lightning.enabled = false
		timer.start(rand_range(15, 20))
		struck = false

func lightningStrikes():
	lightning.enabled = true
	var sound = thunder.instance()
	add_child(sound)
	sound.play_audio()
	timer.start(rand_range(1,3))
	struck = true
func _process(delta):
	lightning.energy = rand_range(.05, .9)


func _on_AudioStreamPlayer_finished():
	audio.stream = anvil
	audio.play(3.65)
