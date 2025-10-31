class_name ProjectList
extends MarginContainer

const PROJECT_ITEM_SCENE := preload("uid://c333trd3hms6c")

@export var delay_between_show : float = 0.5

var projects : Array[Project]:
	get:
		return projects
	set(value):
		if !is_node_ready():
			await ready
		
		projects = value
		_update_projects()

@onready var projects_parent: FlowContainer = %ProjectsParent


func _update_projects() -> void:
	if !is_node_ready():
		await ready
	
	for child in projects_parent.get_children():
		child.queue_free()
	
	for project in projects:
		var project_item = PROJECT_ITEM_SCENE.instantiate() as ProjectItem
		project_item.project = project
		project_item.hide_content()
		
		projects_parent.add_child(project_item)
	
	_slow_reveal()


func _slow_reveal() -> void:
	for child : ProjectItem in projects_parent.get_children():
		await get_tree().create_timer(delay_between_show).timeout
		child.fade(true)
