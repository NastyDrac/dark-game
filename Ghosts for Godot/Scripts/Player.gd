extends KinematicBody2D

onready var lid1 = $"../BlackCover"
onready var lid2 = $"../BlackCover2"
var speed = 100
onready var flashLight = $Flashlight
var velocity = Vector2()
var maxVelocity = Vector2(300, 300)
var batteryLife = Global.batteryLife
onready var timer = $Timer
onready var ghostStop = $Flashlight/Area2D
onready var label = $"../Label"
onready var bubble = $"../Label/NinePatchRect"
var labelLocation = Vector2()
onready var animate = $"../AnimationPlayer"
onready var audio = $"../AudioStreamPlayer2D"
onready var noise = preload("res://Sounds/9mm Magazine Unpack.wav")




func _ready():
	
	if Global.isDark == false:
		animate.play("wakeUp")
		Global.Player = $".."
	else: 
		lid1.queue_free()
		lid2.queue_free()

func movement():
	velocity = Vector2()
	
	if Input.get_action_strength("Down"):
		velocity.y += speed
	if Input.get_action_strength("Up"):
		velocity.y -= speed
	if Input.get_action_strength("Left"):
		velocity.x -= speed
	if Input.get_action_strength("Right"):
		velocity.x += speed
	
	if velocity >= maxVelocity:
		velocity = maxVelocity
	if velocity <= -maxVelocity:
		velocity = -maxVelocity
	
	
	lerp(velocity, Vector2(), 0.2)
	move_and_slide(velocity)
	

func controlLight():
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("click") and flashLight.enabled == false:
		flashLight.enabled = true
		audio.stream = noise
		audio.play()
		timer.start(1)
	elif Input.is_action_just_pressed("click"):
		audio.stream = noise
		audio.play()
		flashLight.enabled = false
	
		
	if Global.batteryLife <= 0:
		flashLight.enabled = false
	if flashLight.enabled == true:
		ghostStop.monitorable = true
	elif flashLight.enabled == false:
		ghostStop.monitorable = false
	
		
	if Global.batteryLife <= 10:
		flashLight.energy = rand_range(.05, .9)
	if flashLight.energy < .2:
		flashLight.enabled = false
	
	if flashLight.enabled == false:
		timer.stop()

func _physics_process(delta):
	movement()
	controlLight()
	Global.set("location", global_position)
	labelLocation.y = global_position.y - 50
	labelLocation.x = global_position.x -300
	label.set_global_position(labelLocation)


func _on_Timer_timeout():
	Global.batteryLife -= Global.drainSpeed
	


func _on_Area2D_area_entered(area):
	if area.is_in_group("Battery"):
		audio.stream = noise
		audio.play()
		Global.batteryLife += 50
		print(batteryLife)
	if area.get_name() == "Ghost":
		death()
	if area.is_in_group("Door"):
		if Input.is_action_pressed("Up"):
			Global.playerLocation = position
			Global.Cabin()
	if area.get_name() == "Woods":
		if Input.is_action_pressed("Down"):
			Global.callScene("res://Mansion.tscn")
		
func welcome(playerText):
	label.visible = true
	label.text = playerText
	yield(get_tree().create_timer(4),"timeout")
	label.visible = false
	
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "wakeUp":
		get_parent().get_parent().startUp()
		lid1.queue_free()
		lid2.queue_free()
	if anim_name == "death":
		get_parent().get_parent().queue_free()
		Global.callScene("res://LoseScreen.tscn")

func death():
	print("dead")
	animate.play("death")
	



