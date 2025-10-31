class_name Experience
extends Resource

@export var company : String
@export var company_link : String
@export var role : String
@export var from_date : Date
@export var until_date : Date
@export var is_current : bool = false
@export var projects : Array[Project]


func get_skills() -> Array[String]:
	var skills : Array[String] = []
	for project in projects:
		for skill in project.skills:
			if !skills.has(skill):
				skills.append(skill)
	
	return skills
