extends CharacterBody2D

@export var move_speed : float = 500
@onready var actionable_finder: Area2D = $Direction/ActinableFinder

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("space"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	print(input_direction)

	velocity = input_direction * move_speed

	move_and_slide()
