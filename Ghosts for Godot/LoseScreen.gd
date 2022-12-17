extends Node2D

onready var animate = $Container/AnimationPlayer

func _ready():
	animate.play("shine")


func _on_Button_pressed():
	Global.isDark = false
	Global.playerLocation = Vector2()
	Global.isDark = false
	Global.callScene("res://TitleScreen.tscn")
