extends Area2D

var guy = preload("res://hacker.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($CollisionShape2D.shape.extents.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn():
	print("guy")
	$CollisionShape2D.shape.extents
	var newguy = guy.instantiate()
	newguy.position.x = randi_range(-$CollisionShape2D.shape.extents.x, $CollisionShape2D.shape.extents.x)
	newguy.position.y = randi_range(-$CollisionShape2D.shape.extents.y, $CollisionShape2D.shape.extents.y)
	add_child(newguy)

func rand_pos():
	var pos = Vector2.ZERO
	pos.x = randi_range(-$CollisionShape2D.shape.extents.x, $CollisionShape2D.shape.extents.x)
	pos.y = randi_range(-$CollisionShape2D.shape.extents.y, $CollisionShape2D.shape.extents.y)
	return pos
