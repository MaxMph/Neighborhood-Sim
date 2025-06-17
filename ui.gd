extends Control

var hours_logged = 0
var hackers = 1
var reviewers = 1
var staff = 0
var staff_clicked = 0

var aplicant_price = 100
var staff_price = 150

@onready var particle = preload("res://hour_particle.tscn")

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	#$"HUD/MarginContainer/HBoxContainer/hours logged".text = "Hackatime Hours: " + Global.displaynum(hours_logged)
	#$HUD/MarginContainer/HBoxContainer/hackers.text = "Hackers: " + str(hackers)
	#$HUD/MarginContainer/HBoxContainer/staff.text = "Staff: " + str(staff)
	
	$phone/MarginContainer/PanelContainer/VBoxContainer/VBoxContainer/price.text = Global.displaynum(aplicant_price)
	$phone/MarginContainer/PanelContainer/VBoxContainer/VBoxContainer2/price.text = Global.displaynum(staff_price)

func clock_ticked() -> void:
	var hours_perclick = hackers
	hours_logged += hours_perclick
	$Clock/AnimationPlayer.stop()
	$Clock/AnimationPlayer.play("button")
	var new_particle = particle.instantiate()
	new_particle.hours = hours_perclick
	new_particle.global_position = Vector2.ZERO
	$particle_spawn.add_child(new_particle)


func aplicant_aproved() -> void:
	if hours_logged >= aplicant_price:
		hours_logged -= aplicant_price
		hackers += reviewers
		#aplicant_price = aplicant_price * 1.25


func _on_staff_timeout() -> void:
	if staff > staff_clicked:
		staff_clicked += 1
		clock_ticked()
		_on_staff_timeout()
	else:
		staff_clicked = 0


func _on_hire_pressed() -> void:
	if hours_logged >= staff_price:
		staff += 1
		hours_logged -= staff_price
		staff_price += roundi(staff_price * 0.25)
