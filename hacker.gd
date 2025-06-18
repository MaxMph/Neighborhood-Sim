extends Node2D

var dark = 0.5
var light = 0.8

var speed = 300
var walk = false

var target_pos

func _ready() -> void:
	$LittleDude.modulate = Color(randf_range(dark, light), randf_range(dark, light), randf_range(dark, light))
	#Color(0.4, 0.4, 0.5) #Color(40, 40, 40, 1)  #Color(randi_range(dark, light), randi_range(dark, light), randi_range(dark, light))
	decide()

func _process(delta: float) -> void:
	if walk == true:
		if position == target_pos:
			decide()
		position.move_toward(target_pos, speed * delta)

func decide():
	print("decide")
	walk = false
	if randf() > 0.5:
		walk = true
		target_pos = get_parent().rand_pos()
	else:
		await get_tree().create_timer(randf() * 2).timeout
		walk = true
		target_pos = get_parent().rand_pos()
	print(target_pos)
