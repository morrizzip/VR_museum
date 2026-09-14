extends CanvasLayer
@onready var world_env: WorldEnvironment = get_node("/root/main/WorldEnvironment") # путь к узлу окружения
@onready var viewport2d_1: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D2") # путь к узлу viewport2d_1
@onready var viewport2d_2: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D")
@onready var viewport2d_3: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D3")
@onready var viewport2d_4: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D4")
@onready var viewport2d_5: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D5")
@onready var viewport2d_6: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D6")
@onready var viewport2d_7: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D7")
@onready var viewport2d_8: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D8")
@onready var viewport2d_9: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D9")
@onready var viewport2d_10: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D10")

@onready var player: Node3D = get_node("/root/main/player") 
@onready var player_camera: XRCamera3D = player.get_node("XROrigin3D/XRCamera3D") 
@onready var player_hand_left: XRController3D = player.get_node("XROrigin3D/LeftController") 
@onready var player_hand_right: XRController3D = player.get_node("XROrigin3D/RightController") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_hotspot9_pressed() -> void:
	#var player_rotation = player.rotation.y
	#change_panorama("res://assets/GS__0857.JPG")
	#print("Нажат hotspot1")
	#viewport2d_1.visible = false
	#player.rotation.y = player_rotation
	# Сохраняем текущий поворот
	var player_rotation = player.rotation.y
	print("Поворот до изменения: ", player_rotation)
	
	# Меняем панораму
	change_panorama("res://assets/GS__0867.JPG")
	print("Нажат hotspot9")
	
	# Скрываем Viewport
	viewport2d_1.visible = false
	viewport2d_2.visible = false
	viewport2d_3.visible = false
	viewport2d_4.visible = false
	viewport2d_5.visible = false	
	viewport2d_6.visible = false	
	viewport2d_7.visible = false	
	viewport2d_8.visible = false	
	viewport2d_9.visible = false	
	viewport2d_10.visible = true		
		
	# Восстанавливаем поворот
	player_camera.rotation.y = player_rotation
	print("Поворот после восстановления: ", player_camera.rotation.y)
	player.rotation.y = player_rotation
	player_hand_left.rotation.y = player_rotation
	player_hand_right.rotation.y = player_rotation
	# Принудительно обновляем трансформацию (на всякий случай)
	#player.global_transform = player.global_transform
	
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
