extends KinematicBody2D


export var speed = 75
var velocity = Vector2()
var destination
var direction
onready var animate = $AnimationPlayer
onready var ghost = load("res://Ghost.tscn")
var paused = 0
onready var noise = preload("res://GhostClose.tscn")
var screamDistance = 1000
var warned = false


func _physics_process(delta):
	movement()
	if position.distance_to(destination) < screamDistance:
		while warned == false:
			
			var warning = noise.instance()
			add_child(warning)
			warning.play_audio()
			warned = true
		


func movement():
	destination = Global.location
	if destination.x < position.x:
		velocity.x = -speed
	elif destination.x > position.x:
		velocity.x = speed
	if destination.y > position.y:
		velocity.y = speed
	elif destination.y < position.y:
		velocity.y = -speed
		
	move_and_slide(velocity)


func _on_Area2D_area_entered(area):
	if area.is_in_group("Light") and paused > 0:
		animate.play("fadeout")
		animate.advance(paused)
	else:
		animate.play("fadeout")
		print("hit")



func _on_Area2D_area_exited(area):
	if area.is_in_group("Light"):
		paused = animate.current_animation_position
		animate.stop()
		


func _on_AnimationPlayer_animation_finished(anim_name):
	var spawn = Vector2(rand_range(0, 3000), rand_range(0, 3000))
	var newGhost = ghost.instance()
	get_parent().add_child(newGhost)
	newGhost.position = spawn
	queue_free()
