extends Control

@export var fade_speed = 1.0
@export var speed = 200
var fric = 2
var x_offset = 0.0
var max_offset = 0.6

var hours = 0
@onready var text = $Label

func _ready() -> void:
	print("spawn")
	text.text = str(hours) + "h"
	x_offset = randf_range(-max_offset, max_offset)
	



func _process(delta: float) -> void:
	position.y += -speed * delta
	position.x += speed * x_offset * delta
	speed = speed * (1 - (fric * delta))
	if text.self_modulate.a == 0:
		remove()
	else:
		text.self_modulate.a -= fade_speed * delta



func remove():
	print("remove")
	queue_free()
