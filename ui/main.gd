class_name Main
extends Control

@export var profile : Profile

@onready var portrait: TextureRect = %Portrait
@onready var name_label: Label = %NameLabel
@onready var current_role: RichTextLabel = %CurrentRole

@onready var professional_project_list: ProjectList = %ProfessionalProjectList
@onready var personal_project_list: ProjectList = %PersonalProjectList

@onready var linkedin_button: URLButton = %LinkedinButton
@onready var itch_button: URLButton = %ItchButton
@onready var email_button: URLButton = %EmailButton


func _ready() -> void:
	DisplayServer.window_set_min_size(Vector2i(512, 384))
	_update_visuals()


func _update_visuals() -> void:
	portrait.texture = profile.portrait
	name_label.text = profile.name
	current_role.text = "[color=#B6244F]%s[/color] at [color=#B6244F]%s[/color]" % \
			[profile.current_role, profile.current_company]
	
	
	professional_project_list.projects = profile.get_professional_projects()
	personal_project_list.projects = profile.personal_projects
	
	linkedin_button.url = profile.linkedin
	itch_button.url = profile.itch
	email_button.url = profile.email
