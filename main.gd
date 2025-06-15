extends Control

var hours_logged = 0
var hackers = 1
var reviewers = 1
var staff = 0
var staff_clicked = 0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	$"HUD/HBoxContainer/hours logged".text = "Hackatime Hours: " + str(hours_logged)
	$HUD/HBoxContainer/hackers.text = "Hackers: " + str(hackers)


func clock_ticked() -> void:
	hours_logged += hackers


func aplicant_aproved() -> void:
	if hours_logged >= 100:
		hours_logged -= 100
		hackers += reviewers


func _on_staff_timeout() -> void:
	if staff > staff_clicked:
		staff_clicked += 1
		clock_ticked()
		_on_staff_timeout()
		print("staff click")
	else:
		staff_clicked = 0


func _on_hire_pressed() -> void:
	staff += 1
