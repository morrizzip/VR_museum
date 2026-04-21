extends CanvasLayer
@onready var viewport_2_din_3d_12: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D12")
@onready var viewport_2_din_3d_13: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D13")
@onready var pickable_object: XRToolsPickable = get_node("/root/main/PickableObject")
@onready var player: Node3D = get_node("/root/main/player") 
@onready var player_camera: XRCamera3D = player.get_node("XROrigin3D/XRCamera3D") 
@onready var main_node: Node3D = get_node("/root/main")

#@onready var mineral_label_node: Label = get_node("/root/main/Viewport2Din3D13/Viewport/CanvasLayer/Control/Label")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(get_tree().root.get_tree_string())
	#print(mineral_label_node.text)
	#main_node.mineral_label_node.text = "Привет"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	## Следуем за камерой, но остаёмся в сцене
	#viewport_2_din_3d_13.global_position = player_camera.global_position + Vector3(0, -0.2, -0.5)
	#viewport_2_din_3d_13.global_rotation = player_camera.global_rotation
	#
	#pickable_object.global_position = player_camera.global_position + Vector3(0.3, -0.1, -0.4)
	#pickable_object.global_rotation = player_camera.global_rotation


func _on_button_point_pressed() -> void:

	#player_camera.add_child(viewport_2_din_3d_13)
	if main_node.mineral_id == 1: #????надо будет друге окна viewport2d3d скрывать тоже, когда плашечка вылезает
		print("Нажата кнопка у Апатита")
		viewport_2_din_3d_12.visible = false	
		viewport_2_din_3d_13.visible = true	
		#main_node = Vecto
		
		#main_node.mineral_label_node.text = "Привет"
		main_node.load_mineral_by_location(1, 2, 5)
		pickable_object.visible = false		
	if main_node.mineral_id == 2:
		print("Нажата кнопка у Аметиста")	
