class_name URLButton
extends Button

@export var logo : Texture2D = null
@export var url : String = "":
	get:
		return url
	set(value):
		url = value
		
		if !is_node_ready():
			await ready
		
		_update_visibility()

@onready var texture_rect: TextureRect = $CenterContainer/TextureRect


func _ready() -> void:
	pressed.connect(_on_button_pressed)
	_update_visibility()


func _update_visibility() -> void:
	texture_rect.texture = logo
	
	if url.is_empty():
		hide()
	else:
		show()


func _on_button_pressed() -> void:
	OS.shell_open(url)
