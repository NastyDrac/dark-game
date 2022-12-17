extends Label


onready var tween = $Tween

func _ready():
	typeOut("Some friends and I planned a trip.  We were going to a secluded retreat in the mountains. \n\n There were only a few cabins and we had taken them all.\n\nThese mountains are supposed to be haunted, if you believe in that kind of thing \n\n We must have stayed up too late, telling scary stories, because I fell asleep. \n\n(Click to Start)")


func _process(delta):
	if Input.is_action_pressed("click"):
		
		Global.callScene("res://TitleScreen.tscn")
		


func typeOut(phrase):
	text = phrase
	tween.interpolate_property(self, "visible_characters", 0, 300, 10, Tween.TRANS_LINEAR)
	tween.start()
