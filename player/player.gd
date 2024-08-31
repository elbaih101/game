extends CharacterBody2D

@export var speed = 400
@onready var animation_tree : AnimationTree = $AnimationTree
var input_direction:Vector2 = Vector2.ZERO
func get_input():
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity = input_direction * speed

func _process(delta) :
	update_animation_params()


func _physics_process(delta):
	get_input()
	move_and_slide()


func  update_animation_params():
	if (velocity==Vector2.ZERO):
		animation_tree["parameters/conditions/idle"]= true
		animation_tree["parameters/conditions/moving"]= false
	else:
		animation_tree["parameters/conditions/moving"]= true
		animation_tree["parameters/conditions/idle"]= false
		
	
