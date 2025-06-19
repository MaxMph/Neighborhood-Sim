extends Area2D

var location = 1
var target_pos = Vector2.ZERO

@export var camera: Camera2D
@export var marker1: Marker2D
@export var marker2: Marker2D

func _process(delta: float) -> void:
	camera.global_position = lerp(camera.global_position, target_pos, 4 * delta)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		match location:
			1:
				target_pos = marker2.global_position
				#$"../cam pos/Camera2D".global_position = $"../cam pos/Marker2D2".global_position
				location = 2
			2:
				target_pos = marker1.global_position
				#$"../cam pos/Camera2D".global_position = $"../cam pos/Marker2D".global_position
				location = 1
		
		#if $"../cam pos/Camera2D".global_position  == $"../cam pos/Marker2D".global_position: 
			#$"../cam pos/Camera2D".global_position = $"../cam pos/Marker2D2".global_position
		#if $"../cam pos/Camera2D".global_position == $"../cam pos/Marker2D2".global_position:
			#$"../cam pos/Camera2D".global_position = $"../cam pos/Marker2D".global_position
		#$"../cam pos/Marker2D".global_position.move_toward()
		#global_position = lerp(global_position, $"../cam pos/Marker2D2".position, 20)
		#
