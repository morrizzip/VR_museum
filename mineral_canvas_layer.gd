extends CanvasLayer
@onready var label: Label = $Control/Label
@onready var viewport_2_din_3d_13: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D13")
@onready var main_node: Node3D = get_node("/root/main")
@onready var panel_4: Node3D = get_node("/root/main/panel4")

#points
@onready var viewport_2_din_3d_12: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D12")
@onready var point_mineral2_viewport_2_din_3d: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral2_Viewport2Din3D")
@onready var point_mineral5_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral5_Viewport2Din3D")
@onready var point_mineral6_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral6_Viewport2Din3D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(label.get_path())
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_close_pressed() -> void:
	
	viewport_2_din_3d_13.visible = false
	panel_4.visible = false
	print(main_node.select_mineral_id)
	if main_node.current_pickable:
		main_node.current_pickable.visible = false
	if main_node.select_mineral_id == "1":
		viewport_2_din_3d_12.visible = true
	if main_node.select_mineral_id  == "2":
		#point_mineral2_viewport_2_din_3d.visible = true		
		point_mineral5_Viewport2Din3D.visible = true
		point_mineral6_Viewport2Din3D.visible = true
	if main_node.select_mineral_id  == "3":
		#point_mineral2_viewport_2_din_3d.visible = true		
		point_mineral6_Viewport2Din3D.visible = true	
