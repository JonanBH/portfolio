class_name ProjectList
extends MarginContainer

const PROJECT_ITEM_SCENE := preload("uid://c333trd3hms6c")

var projects : Array[Project]:
	get:
		return projects
	set(value):
		if !is_node_ready():
			await ready
		
		projects = value
		_update_projects()

@onready var projects_parent: FlowContainer = $ProjectsParent


func _ready() -> void:
	projects = [preload("uid://crohvk5gkhog0"),preload("uid://b1ngsfsgh8ehi"),preload("uid://crohvk5gkhog0"),preload("uid://b1ngsfsgh8ehi")]
	_update_projects()


func _update_projects() -> void:
	for child in projects_parent.get_children():
		child.queue_free()
	
	for project in projects:
		var project_item = PROJECT_ITEM_SCENE.instantiate() as ProjectItem
		project_item.project = project
		
		projects_parent.add_child(project_item)
