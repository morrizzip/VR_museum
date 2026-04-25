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
@onready var arrow_12_viewport2d_14: XRToolsViewport2DIn3D = get_node("/root/main/arrow_12_Viewport2Din3D14")
@onready var arrow_13_Viewport2Din3D15: XRToolsViewport2DIn3D = get_node("/root/main/arrow_13_Viewport2Din3D15")
@onready var arrow_14_Viewport2Din3D16: XRToolsViewport2DIn3D = get_node("/root/main/arrow_14_Viewport2Din3D16")
@onready var arrow_15_Viewport2Din3D17: XRToolsViewport2DIn3D = get_node("/root/main/arrow_15_Viewport2Din3D17")
@onready var arrow_16_Viewport2Din3D18: XRToolsViewport2DIn3D = get_node("/root/main/arrow_16_Viewport2Din3D18")
@onready var arrow_17_Viewport2Din3D19: XRToolsViewport2DIn3D = get_node("/root/main/arrow_17_Viewport2Din3D19")
@onready var arrow_18_Viewport2Din3D20: XRToolsViewport2DIn3D = get_node("/root/main/arrow_18_Viewport2Din3D20")
@onready var arrow_19_Viewport2Din3D21: XRToolsViewport2DIn3D = get_node("/root/main/arrow_19_Viewport2Din3D21")
@onready var arrow_20_Viewport2Din3D22: XRToolsViewport2DIn3D = get_node("/root/main/arrow_20_Viewport2Din3D22")
@onready var arrow_21_Viewport2Din3D23: XRToolsViewport2DIn3D = get_node("/root/main/arrow_21_Viewport2Din3D23")
@onready var arrow_22_Viewport2Din3D24: XRToolsViewport2DIn3D = get_node("/root/main/arrow_22_Viewport2Din3D24")
@onready var arrow_23_Viewport2Din3D25: XRToolsViewport2DIn3D = get_node("/root/main/arrow_23_Viewport2Din3D25")
@onready var arrow_24_Viewport2Din3D26: XRToolsViewport2DIn3D = get_node("/root/main/arrow_24_Viewport2Din3D26")
#arrows_back
@onready var arrow_back1_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/arrow_back1_Viewport2Din3D")
@onready var arrow_back2_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/arrow_back2_Viewport2Din3D")

@onready var main_node: Node3D = get_node("/root/main")
#points
@onready var point_mineral_2_viewport_2_din_3d: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral2_Viewport2Din3D")
@onready var point_mineral_1_viewport2d_12: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D12")
@onready var point_mineral3_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral3_Viewport2Din3D")
@onready var point_mineral4_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral4_Viewport2Din3D")
@onready var point_mineral5_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral5_Viewport2Din3D")
@onready var point_mineral6_Viewport2Din3D: XRToolsViewport2DIn3D = get_node("/root/main/point_mineral6_Viewport2Din3D")


#@onready var viewport2d_11: XRToolsViewport2DIn3D = get_node("/root/main/Viewport2Din3D11")

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


func _on_button_hotspot10_pressed() -> void:
	#var player_rotation = player.rotation.y
	#change_panorama("res://assets/GS__0857.JPG")
	#print("Нажат hotspot1")
	#viewport2d_1.visible = false
	#player.rotation.y = player_rotation
	# Сохраняем текущий поворот
	var player_rotation = player.rotation.y
	print("Поворот до изменения: ", player_rotation)


	if main_node.arrow_id == 10:
		change_panorama("res://assets/GS__0868.JPG")
		viewport2d_10.visible = false #текущая стрелка
		arrow_13_Viewport2Din3D15.visible = true  #следующая стрелка
		
		#viewport2d_6.visible = true		
	if main_node.arrow_id == 12:
		change_panorama("res://assets/GS__0863.JPG")
		arrow_12_viewport2d_14.visible = false #текущая стрелка
		viewport2d_6.visible = true #следующая стрелка
		viewport2d_1.visible = false #первая стрелка
		
		player_camera.rotation.y = player_rotation
		player.rotation.y = player_rotation
		player_hand_left.rotation.y = player_rotation
		player_hand_right.rotation.y = player_rotation
				
		arrow_back1_Viewport2Din3D.visible = true
		
		point_mineral_1_viewport2d_12.visible = true
		#point_mineral_2_viewport_2_din_3d.visible = true
		
	if main_node.arrow_id == 13:
		change_panorama("res://assets/GS__0885.JPG")
				#viewport2d_10.visible = false	
		arrow_13_Viewport2Din3D15.visible = false #текущая стрелка
		arrow_14_Viewport2Din3D16.visible = true #следующая стрелка
		
	if main_node.arrow_id == 14:
		change_panorama("res://assets/GS__0884.JPG")
		arrow_14_Viewport2Din3D16.visible = false #текущая стрелка
		arrow_15_Viewport2Din3D17.visible = true #следующая стрелка
		
	if main_node.arrow_id == 15:
		change_panorama("res://assets/GS__0883.JPG")
		arrow_15_Viewport2Din3D17.visible = false #текущая стрелка		
		arrow_16_Viewport2Din3D18.visible = true #следующая стрелка
		point_mineral5_Viewport2Din3D.visible = true
		point_mineral6_Viewport2Din3D.visible = true
		
	if main_node.arrow_id == 16:
		change_panorama("res://assets/GS__0882.JPG")
		arrow_16_Viewport2Din3D18.visible = false #текущая стрелка		
		arrow_17_Viewport2Din3D19.visible = true #следующая стрелка
		point_mineral5_Viewport2Din3D.visible = false
		point_mineral6_Viewport2Din3D.visible = false
			
		#viewport2d_10.visible = false	#предыдущая стрелка
		#следующая стрелка		

	if main_node.arrow_id == 17:
		change_panorama("res://assets/GS__0881.JPG")
		arrow_17_Viewport2Din3D19.visible = false #текущая стрелка		
		arrow_18_Viewport2Din3D20.visible = true #следующая стрелка

	if main_node.arrow_id == 18:
		change_panorama("res://assets/GS__0880.JPG")
		arrow_18_Viewport2Din3D20.visible = false #текущая стрелка		
		arrow_19_Viewport2Din3D21.visible = true #следующая стрелка
		
	if main_node.arrow_id == 19:
		change_panorama("res://assets/GS__0879.JPG")
		arrow_19_Viewport2Din3D21.visible = false #текущая стрелка		
		arrow_20_Viewport2Din3D22.visible = true #следующая стрелка

	if main_node.arrow_id == 20:
		change_panorama("res://assets/GS__0878.JPG")
		arrow_20_Viewport2Din3D22.visible = false #текущая стрелка		
		arrow_21_Viewport2Din3D23.visible = true #следующая стрелка
		
	if main_node.arrow_id == 21:
		change_panorama("res://assets/GS__0877.JPG")
		arrow_21_Viewport2Din3D23.visible = false #текущая стрелка		
		arrow_22_Viewport2Din3D24.visible = true #следующая стрелка		

	if main_node.arrow_id == 22:
		change_panorama("res://assets/GS__0876.JPG")
		arrow_22_Viewport2Din3D24.visible = false #текущая стрелка		
		arrow_23_Viewport2Din3D25.visible = true #следующая стрелка		
		
	if main_node.arrow_id == 23:
		change_panorama("res://assets/GS__0874.JPG")
		arrow_23_Viewport2Din3D25.visible = false #текущая стрелка		
		arrow_24_Viewport2Din3D26.visible = true #следующая стрелка
		
	if main_node.arrow_id == 24:
		change_panorama("res://assets/GS__0873.JPG")
		arrow_24_Viewport2Din3D26.visible = false #текущая стрелка		
		#arrow_22_Viewport2Din3D24.visible = true #следующая стрелка		
		
	if main_node.arrow_id == 25:
		change_panorama("res://assets/GS__0855_edit.png")
		#arrow_12_viewport2d_14.visible = false #текущая стрелка
		#arrow_12_viewport2d_14.visible = true #следующая стрелка
		viewport2d_1.visible = true
		arrow_12_viewport2d_14.visible = true
		arrow_back1_Viewport2Din3D.visible = false
		viewport2d_6.visible = false
		point_mineral_1_viewport2d_12.visible = false
		point_mineral_2_viewport_2_din_3d.visible = false		
		
	if main_node.arrow_id == 26:
		change_panorama("res://assets/GS__0855_edit.png")
		#arrow_12_viewport2d_14.visible = false #текущая стрелка
		#arrow_12_viewport2d_14.visible = true #следующая стрелка
		viewport2d_1.visible = true
		arrow_12_viewport2d_14.visible = true
		#arrow_back1_Viewport2Din3D.visible = false
		#viewport2d_6.visible = false
		viewport2d_2.visible = false
		arrow_back2_Viewport2Din3D.visible = false
		point_mineral3_Viewport2Din3D.visible = false
		point_mineral4_Viewport2Din3D.visible = false
		
	# Меняем панораму
	#change_panorama("res://assets/GS__0868.JPG")
	#print("Нажат hotspot10")
	
	# Скрываем Viewport
	#viewport2d_1.visible = false
	viewport2d_2.visible = false
	viewport2d_3.visible = false
	viewport2d_4.visible = false
	viewport2d_5.visible = false	
	#viewport2d_6.visible = false	
	viewport2d_7.visible = false	
	viewport2d_8.visible = false	
	viewport2d_9.visible = false	
	viewport2d_10.visible = false	
	

		
	#viewport2d_11.visible = true		
		
	# Восстанавливаем поворот
	#player_camera.rotation.y = player_rotation
	#print("Поворот после восстановления: ", player_camera.rotation.y)
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
