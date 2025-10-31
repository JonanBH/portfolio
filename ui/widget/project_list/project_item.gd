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


@onready var image: TextureRect = %Image
@onready var title_label: Label = %TitleLabel
@onready var role: Label = %Role
@onready var tag_container: TagContainer = %TagContainer
@onready var button: Button = %ProjectButton
@onready var animation_player: AnimationPlayer = %FadeAnimationPlayer



func _ready() -> void:
	button.pressed.connect(_on_button_pressed)
	project = preload("uid://crohvk5gkhog0")


func _update_project() -> void:
	image.texture = project.portrait_image
	title_label.text = project.title
	role.text = project.role
	tag_container.tags = project.tags


func _on_button_pressed() -> void:
	print("pressed")


func fade(is_in : bool) -> void:
	if is_in:
		animation_player.play("fade_in")
	else:
		animation_player.play("fade_out")


func hide_content() -> void:
	modulate.a = 0
