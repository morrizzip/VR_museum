extends Node3D

#@onready var start_menu: XRToolsViewport2DIn3D = get_node("/root/main/start_menu")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_M):
		_on_left_controller_button_pressed("menu_button")


func _on_left_controller_button_pressed(name: String) -> void:
	if name == "menu_button":  # Кнопка меню на левом контроллере
		get_tree().change_scene_to_file("res://start_scene.tscn")
		#control_watch.visible = true
