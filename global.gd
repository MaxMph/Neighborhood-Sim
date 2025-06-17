extends Node



func _ready() -> void:
	pass



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
