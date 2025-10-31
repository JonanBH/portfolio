class_name TagContainer
extends MarginContainer

const TAG_SCENE = preload("uid://b1kalp84yh27y")

var tags : Array[Tag]:
	get:
		return tags
	set(value):
		if !is_node_ready():
			await ready
		
		tags = value
		_update_tags()

@onready var tags_parent: HFlowContainer = $TagsParent


func _update_tags():
	for child in tags_parent.get_children():
		child.queue_free()
	
	for tag in tags:
		var new_tag : TagWidget = TAG_SCENE.instantiate()
		new_tag.tag = tag
		tags_parent.add_child(new_tag)
