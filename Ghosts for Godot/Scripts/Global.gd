extends Node

var currentScene
var isDark = false
var location = Vector2()
var keyLocation = 100
var keepLooking = 40
var conclusion = false
var Player
var playerLocation = Vector2()
var batteryLife = 100
var difficulty = 0
var drainSpeed = 1
var cabin
var entered
var hasKey = false

func _ready():
	randomize()
	cabin = round(rand_range(1,4))
	entered = cabin
	print(cabin)
	var root = get_tree().get_root()
	

	
func _process(delta):
	if batteryLife <= 0:
		batteryLife = 0
	if batteryLife >= 100:
		batteryLife = 100

func Cabin():
	entered -= 1
	callScene("res://Cabin.tscn")
	
	
	
func Woods():
	get_tree().change_scene("res://Mansion.tscn")
	
	
func callScene(path):
	currentScene = get_tree().current_scene
	get_tree().change_scene(path)
	currentScene.call_deferred("free")
	

