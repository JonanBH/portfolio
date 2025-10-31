class_name ProjectItem
extends MarginContainer

var project : Project:
	get:
		return project
	set(value):
		if !is_node_ready():
			await ready
		
		project = value
		_update_project()


@onready var image: TextureRect = $PanelContainer/MarginContainer/VBoxContainer/Image
@onready var title_label: Label = $PanelContainer/MarginContainer/VBoxContainer/TitleLabel
@onready var role: Label = $PanelContainer/MarginContainer/VBoxContainer/Role
@onready var tag_container: TagContainer = $PanelContainer/MarginContainer/VBoxContainer/TagContainer


func _ready() -> void:
	project = preload("uid://crohvk5gkhog0")


func _update_project() -> void:
	image.texture = project.portrait_image
	title_label.text = project.title
	role.text = project.role
	tag_container.tags = project.tags
