extends CharacterBody2D

var speed = 400
var distance_axis = 1.3

func _ready() -> void:
	for axi in $obj.get_children():
		axi.position *= distance_axis


func _process(delta: float) -> void:
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = dir * speed
	move_and_slide()
