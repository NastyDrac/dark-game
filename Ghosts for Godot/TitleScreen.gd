extends Node2D


onready var audio = $AudioStreamPlayer2D
onready var thunder = preload("res://Sounds/thunder_strike_1.ogg")
onready var description = $Description
onready var title = $GridContainer/Label
onready var tween = $Tween
onready var contest = $Contest

func _ready():
	contest.blam()
	title.text = "The Midnight Hour"
	tween.interpolate_property(title, "visible_characters", 0, 17, 4, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.start()
	audio.stream = thunder
	audio.play()
	
func _process(delta):
	pass
	

func _on_EasyButton_pressed():
	Global.difficulty = 1
	Global.drainSpeed = 1
	Global.callScene("res://Mansion.tscn")


func _on_MedButton_pressed():
	Global.difficulty = 2
	Global.drainSpeed = 1
	Global.callScene("res://Mansion.tscn")


func _on_HardButton_pressed():
	Global.difficulty = 3
	Global.drainSpeed = 2
	Global.callScene("res://Mansion.tscn")


func _on_EasyButton_mouse_entered():
	description.text = "Fewer ghosts and your flashlight's battery drains slowly."


func _on_MedButton_mouse_entered():
	description.text = "More ghosts, but your flashlight's battery still drains slowly"


func _on_HardButton_mouse_entered():
	description.text = "More ghosts and your flashlight's battery drains faster"
