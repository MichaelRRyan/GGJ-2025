extends Resource

class Status:
	var StatusName: String
	var multiplier: float
	
	
static create_status(status_name : String, multiplier : float):
	var status = Status(status_name, multiplier)
