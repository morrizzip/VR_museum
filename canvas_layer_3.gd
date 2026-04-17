extends CanvasLayer
@onready var world_env: WorldEnvironment = get_node("/root/main/WorldEnvironment") # путь к узлу окружения
@onready var viewport2d_1: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D2") # путь к узлу viewport2d_1
@onready var viewport2d_2: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D")
@onready var viewport2d_3: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D3")

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


func _on_button_hotspot2_pressed() -> void:
	#var player_rotation = player.rotation.y
	#change_panorama("res://assets/GS__0857.JPG")
	#print("Нажат hotspot1")
	#viewport2d_1.visible = false
	#player.rotation.y = player_rotation
	# Сохраняем текущий поворот
	
	#var player_rotation = player.rotation.y
	
	#print("Поворот до изменения: ", player_rotation)
	
	# Меняем панораму
	change_panorama("res://assets/GS__0858.JPG")
	print("Нажат hotspot2")
	
	# Скрываем Viewport
	viewport2d_1.visible = false
	viewport2d_2.visible = false
	viewport2d_3.visible = true
	
	# Восстанавливаем поворот
	#player_camera.rotation.y = player_rotation
	print("Поворот после восстановления: ", player_camera.rotation.y)
	#player.rotation.y = player_rotation
	#player_hand_left.rotation.y = player_rotation
	#player_hand_right.rotation.y = player_rotation
	
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
