extends Control

@onready var particle = preload("res://hour_particle.tscn")

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	$"Hud/HUD bar/MarginContainer/HBoxContainer/hours logged".text = "Hackatime Hours: " + Global.displaynum(Global.hours_logged)
	$"Hud/HUD bar/MarginContainer/HBoxContainer/hackers".text = "Hackers: " + str(Global.hackers)
	$"Hud/HUD bar/MarginContainer/HBoxContainer/staff".text = "Staff: " + str(Global.staff)
	
	$phone/MarginContainer/PanelContainer/VBoxContainer/VBoxContainer/price.text = Global.displaynum(Global.aplicant_price)
	$phone/MarginContainer/PanelContainer/VBoxContainer/VBoxContainer2/price.text = Global.displaynum(Global.staff_price)

func clock_ticked() -> void:
	var hours_perclick = Global.hackers
	Global.hours_logged += hours_perclick
	$"../../clock/clock/AnimationPlayer".stop()
	$"../../clock/clock/AnimationPlayer".play("clicked")
	$"../../clock/clock/min hand/AnimationPlayer2".stop()
	$"../../clock/clock/min hand/AnimationPlayer2".play("minute_hand")
	var new_particle = particle.instantiate()
	new_particle.hours = hours_perclick
	new_particle.global_position = Vector2.ZERO
	$"../..".add_child(new_particle)


func aplicant_aproved() -> void:
	if Global.hours_logged >= Global.aplicant_price:
		Global.hours_logged -= Global.aplicant_price
		Global.hackers += Global.reviewers
		#aplicant_price = aplicant_price * 1.25


func _on_staff_timeout() -> void:
	if Global.staff > Global.staff_clicked:
		Global.staff_clicked += 1
		clock_ticked()
		_on_staff_timeout()
	else:
		Global.staff_clicked = 0


func _on_hire_pressed() -> void:
	if Global.hours_logged >= Global.staff_price:
		Global.staff += 1
		Global.hours_logged -= Global.staff_price
		Global.staff_price += roundi(Global.staff_price * 0.25)
		$"../../roam area".spawn()
