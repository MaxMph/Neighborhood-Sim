extends Node



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
	"staff_price": 0,
	"hackers": 0,
	"aplicant_price": 0,
}

func _exit_tree() -> void:
	_save()


func _save():
	save_data.hours = 0 #hours var
	save_data.staff
	save_data.staff_price
	#save_data.shipment_ids = shipments_made
	
	var savefile = FileAccess.open(save_location, FileAccess.WRITE)
	savefile.store_var(save_data.duplicate())
	savefile.close()

func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var loaded_save_data = data.duplicate()
		#drop_ids = loaded_save_data.ids
		#shipments_made = loaded_save_data.shipment_ids
		#print(drop_ids)

func close():
	_save()
	get_tree().quit()
