extends Node2D

var dark = 0.5
var light = 0.8

var speed = 140
var ani_speed = 0.2
var walk = false

var target_pos

func _ready() -> void:
	modulate = Color(randf_range(dark, light), randf_range(dark, light), randf_range(dark, light))
	#Color(0.4, 0.4, 0.5) #Color(40, 40, 40, 1)  #Color(randi_range(dark, light), randi_range(dark, light), randi_range(dark, light))
	decide()

func _process(delta: float) -> void:
	if walk == true:
		if $Timer.is_stopped():
			start_walk()
		#walk ani stuff
		#if position == target_pos:
		if global_position.distance_to(target_pos) < speed * delta:
			decide()
		else:
			print("agagooba")
			position += global_position.direction_to(target_pos) * speed * delta
			position.move_toward(target_pos, speed * delta)
			#position = lerp(position, target_pos, speed * delta)
			#position.move_toward(target_pos, speed * delta)

func decide():
	print("decide")
	walk = false
	$LittleDude.show()
	$LittleDude2.hide()
	$Timer.stop()
	if randf() > 0.5:
		walk = true
		target_pos = get_parent().rand_pos()
		$Timer.stop()
	else:
		await get_tree().create_timer(randf() * 4).timeout
		walk = true
		target_pos = get_parent().rand_pos()
	print(target_pos)



func _on_timer_timeout() -> void:
	if walk:
		$LittleDude2.flip_h = !$LittleDude2.flip_h
		
	

func start_walk():
	$LittleDude2.show()
	$LittleDude.hide()
	if $Timer.is_stopped():
		$Timer.start()
