extends CharacterBody2D


const SPEED = 240.0
const fric = 20.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized()
	if direction != Vector2.ZERO:
		if direction.x:
			velocity.x = direction.x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, fric)
		if direction.y:
			velocity.y = direction.y * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, fric)
	else:
		#velocity.move_toward(Vector2.ZERO, fric * delta)# * delta)
		velocity.x = move_toward(velocity.x, 0, fric)
		velocity.y = move_toward(velocity.y, 0, fric )

	move_and_slide()
