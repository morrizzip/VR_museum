extends Node3D

@onready var world_env: WorldEnvironment = $WorldEnvironment  # путь к узлу окружения
@onready var viewport2d_2: XRToolsViewport2DIn3D = $Viewport2Din3D
@onready var viewport2d_3: XRToolsViewport2DIn3D = $Viewport2Din3D3
@onready var viewport2d_4: XRToolsViewport2DIn3D = $Viewport2Din3D4
@onready var viewport2d_5: XRToolsViewport2DIn3D = $Viewport2Din3D5
@onready var viewport2d_6: XRToolsViewport2DIn3D = $Viewport2Din3D6
@onready var viewport2d_7: XRToolsViewport2DIn3D = $Viewport2Din3D7
@onready var viewport2d_8: XRToolsViewport2DIn3D = $Viewport2Din3D8
@onready var viewport2d_9: XRToolsViewport2DIn3D = $Viewport2Din3D9
@onready var viewport2d_10: XRToolsViewport2DIn3D = $Viewport2Din3D10
@onready var viewport2d_11: XRToolsViewport2DIn3D = $Viewport2Din3D11

@onready var viewport_2_din_3d_12: XRToolsViewport2DIn3D = $Viewport2Din3D12
@onready var viewport_2_din_3d_13: XRToolsViewport2DIn3D = $Viewport2Din3D13
@onready var pickable_object: XRToolsPickable = $PickableObject
		
		
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	var texture = load("res://assets/GS__0855_edit.png")
	if texture:
	
		var sky_material = world_env.environment.sky.sky_material
		if sky_material is PanoramaSkyMaterial:
			sky_material.panorama = texture
			print("Панорама изменена на: ", "res://assets/GS__0855_edit.png")
		else:
			print("Ошибка: sky_material не является PanoramaSkyMaterial")
	else:
		print("Не удалось загрузить текстуру: ", "res://assets/GS__0855_edit.png")
	
	viewport2d_2.visible = false
	viewport2d_3.visible = false
	viewport2d_4.visible = false
	viewport2d_5.visible = false
	viewport2d_6.visible = false
	viewport2d_7.visible = false		
	viewport2d_8.visible = false	
	viewport2d_9.visible = false	
	viewport2d_10.visible = false	
	viewport2d_11.visible = false	
	viewport_2_din_3d_12.visible = false	
	viewport_2_din_3d_13.visible = false	
	pickable_object.visible = false	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_room"): 
		change_panorama("res://assets/GS__0857.JPG")
		print("Shift нажата")

func change_panorama(new_path: String) -> void:
	var texture = load(new_path)
	if texture:
	
		var sky_material = world_env.environment.sky.sky_material
		if sky_material is PanoramaSkyMaterial:
			sky_material.panorama = texture
			print("Панорама изменена на: ", new_path)
		else:
			print("Ошибка: sky_material не является PanoramaSkyMaterial")
	else:
		print("Не удалось загрузить текстуру: ", new_path)
