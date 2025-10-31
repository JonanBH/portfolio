class_name Profile
extends Resource

@export_category("Basic information")
@export var name : String
@export var portrait : Texture2D
@export var about : String

@export_category("Socials")
@export var linkedin : String
@export var email : String
@export var itch : String
@export var steam : String
@export var github : String

@export_category("Professional")
@export var experiences : Array[Experience]
@export var personal_projects : Array[Project]
@export var current_role : String
@export var current_company : String


func get_all_skills() -> Array[String]:
	var all_skills : Array[String] = []
	for experience in experiences:
		var skills = experience.get_skills()
		for skill in skills:
			if !all_skills.has(skill):
				all_skills.append(skill)
	
	return all_skills


func get_professional_projects() -> Array[Project]:
	var projects : Array[Project] = []
	
	for experience in experiences:
		for project in experience.projects:
			if !projects.has(project):
				projects.append(project)
	
	return projects
