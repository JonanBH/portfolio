class_name TagWidget
extends MarginContainer

@export var tag : Tag :
	set(value):
		if !is_node_ready():
			await ready
		
		color_rect.color = value.color
		label.text = value.name
		tag = value
	get:
		return tag
		
@onready var color_rect: ColorRect = $MarginContainer/HBoxContainer/ColorRect
@onready var label: Label = $MarginContainer/HBoxContainer/Label
