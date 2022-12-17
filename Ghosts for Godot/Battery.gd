extends Area2D


onready var animate = $AnimationPlayer

func _ready():
	animate.play("Flash")

func _on_AnimationPlayer_animation_finished(anim_name):
	animate.play("Flash")


func _on_Battery_area_entered(area):
	if area.get_name() == "Player":
		queue_free()
		
