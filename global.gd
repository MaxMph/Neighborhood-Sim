extends Node


var hours_logged = 20000
var hackers = 1
var reviewers = 1
var staff = 0
var staff_clicked = 0

var aplicant_price = 100
var staff_price = 100

func _ready() -> void:
	_load()

func _process(delta: float) -> void:
	pass

func displaynum(num):
	var num_text
	var digit_length
	#digit_length = str(num).length()
	#digit_length -= 1
	#print(digit_length)
	#num_text = floor(num * pow(10, digit_length))
	#num_text = floor(num / (num * pow(10, digit_length)))
	#print(num_text)
	
	#return "vasdvars"
	if num > 999999999:
		num_text = floor(num * 0.00000001)
		num_text = num_text * 0.1
		return str(num_text) + "B"
	elif num > 999999:
		
		num_text = floor(num * 0.00001)
		num_text = num_text * 0.1
		return str(num_text) + "M"
	else:
		return str(num)

const save_location = "user://savefile.json"

var save_data: Dictionary = {
	"hours": 0,
	"staff": 0,
	"staff_price": 100,
	"hackers": 1,
	"aplicant_price": 100,
}

func _exit_tree() -> void:
	_save()


func _save():
	save_data.hours = hours_logged
	save_data.staff = staff
	save_data.staff_price = staff_price
	save_data.hackers = hackers
	save_data.aplicant_price = aplicant_price
	
	var savefile = FileAccess.open(save_location, FileAccess.WRITE)
	savefile.store_var(save_data.duplicate())
	savefile.close()

func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var loaded_save_data = data.duplicate()
		hours_logged = loaded_save_data.hours
		hackers = loaded_save_data.hackers
		staff = loaded_save_data.staff
		aplicant_price = loaded_save_data.aplicant_price
		staff_price = loaded_save_data.staff_price

func close():
	_save()
	get_tree().quit()
