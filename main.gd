#extends Node3D
#
#@onready var world_env: WorldEnvironment = $WorldEnvironment  # путь к узлу окружения
#@onready var viewport2d_2: XRToolsViewport2DIn3D = $Viewport2Din3D
#@onready var viewport2d_3: XRToolsViewport2DIn3D = $Viewport2Din3D3
#@onready var viewport2d_4: XRToolsViewport2DIn3D = $Viewport2Din3D4
#@onready var viewport2d_5: XRToolsViewport2DIn3D = $Viewport2Din3D5
#@onready var viewport2d_6: XRToolsViewport2DIn3D = $Viewport2Din3D6
#@onready var viewport2d_7: XRToolsViewport2DIn3D = $Viewport2Din3D7
#@onready var viewport2d_8: XRToolsViewport2DIn3D = $Viewport2Din3D8
#@onready var viewport2d_9: XRToolsViewport2DIn3D = $Viewport2Din3D9
#@onready var viewport2d_10: XRToolsViewport2DIn3D = $Viewport2Din3D10
#@onready var viewport2d_11: XRToolsViewport2DIn3D = $Viewport2Din3D11
#
#@onready var viewport_2_din_3d_12: XRToolsViewport2DIn3D = $Viewport2Din3D12
#@onready var viewport_2_din_3d_13: XRToolsViewport2DIn3D = $Viewport2Din3D13
#@onready var pickable_object: XRToolsPickable = $PickableObject
		#
#@onready var mineral_label_node: Label = viewport_2_din_3d_13.get_node("Viewport/CanvasLayer/Control/Label")		
		#
#var mineral_id = 0		
		#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	##pass # Replace with function body.
	#var texture = load("res://assets/GS__0855_edit.png")
	#if texture:
	#
		#var sky_material = world_env.environment.sky.sky_material
		#if sky_material is PanoramaSkyMaterial:
			#sky_material.panorama = texture
			#print("Панорама изменена на: ", "res://assets/GS__0855_edit.png")
		#else:
			#print("Ошибка: sky_material не является PanoramaSkyMaterial")
	#else:
		#print("Не удалось загрузить текстуру: ", "res://assets/GS__0855_edit.png")
	#
	#viewport2d_2.visible = false
	#viewport2d_3.visible = false
	#viewport2d_4.visible = false
	#viewport2d_5.visible = false
	#viewport2d_6.visible = false
	#viewport2d_7.visible = false		
	#viewport2d_8.visible = false	
	#viewport2d_9.visible = false	
	#viewport2d_10.visible = false	
	#viewport2d_11.visible = false	
	#viewport_2_din_3d_12.visible = false	
	#viewport_2_din_3d_13.visible = true	
	#pickable_object.visible = false	
	#
	#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("next_room"): 
		#change_panorama("res://assets/GS__0857.JPG")
		#print("Shift нажата")
#
#func change_panorama(new_path: String) -> void:
	#var texture = load(new_path)
	#if texture:
	#
		#var sky_material = world_env.environment.sky.sky_material
		#if sky_material is PanoramaSkyMaterial:
			#sky_material.panorama = texture
			#print("Панорама изменена на: ", new_path)
		#else:
			#print("Ошибка: sky_material не является PanoramaSkyMaterial")
	#else:
		#print("Не удалось загрузить текстуру: ", new_path)
#
#
#func _on_viewport_2_din_3d_13_pointer_event(event: Variant) -> void:
	##print("СОБЫТИЕ ОТСЛЕДИЛОСЬ!")
	##mineral_id = 1
	#pass
#
#func _on_viewport_2_din_3d_13_visibility_changed() -> void:
	##print("СОБЫТИЕ видмости ОТСЛЕДИЛОСЬ!")
	##if (viewport_2_din_3d_13.visible == true):
		##print("Видимость положительна")
	#pass
#
##func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	###if event is InputEventAction and event.action == "trigger_click" and event.pressed:
		###print("Нажата точка у Апатита")#get_node("/root/Main/CanvasLayer").show_info(mineral_id)
	##pass
#
#
#func _on_viewport_2_din_3d_12_pointer_event(event: Variant) -> void:
	#mineral_id = 1
#
#
#func _on_point_mineral_2_viewport_2_din_3d_pointer_event(event: Variant) -> void:
	#mineral_id = 2
#
##func change_text_mineral_label(new_name: String):
	##mineral_label_node.text = new_name




	
extends Node3D

@onready var world_env: WorldEnvironment = $WorldEnvironment
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
@onready var mineral_label_node: Label = viewport_2_din_3d_13.get_node("Viewport/CanvasLayer/Control/Label")

var mineral_id = 0
#var server_url = "http://192.168.1.10:5000"
var server_url = "http://localhost:5000"
var minerals_data = []
var models_cache = {}

func _ready() -> void:
	var texture = load("res://assets/GS__0855_edit.png")
	if texture:
		var sky_material = world_env.environment.sky.sky_material
		if sky_material is PanoramaSkyMaterial:
			sky_material.panorama = texture
			print("Панорама изменена")
	
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
	viewport_2_din_3d_13.visible = true	
	pickable_object.visible = false
	
	load_minerals_from_server()

func load_minerals_from_server():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(_on_minerals_loaded)
	
	var url = server_url + "/api/minerals"
	var error = http_request.request(url)
	
	if error != OK:
		print("Ошибка подключения к серверу: ", error)
		load_local_minerals()

func _on_minerals_loaded(result, response_code, headers, body):
	if response_code == 200:
		var json = JSON.new()
		var parse_result = json.parse(body.get_string_from_utf8())
		if parse_result == OK:
			var data = json.data
			if typeof(data) == TYPE_DICTIONARY and data.has("minerals"):
				minerals_data = data["minerals"]
				print("Загружено минералов: ", minerals_data.size())
				load_all_models()
			else:
				load_local_minerals()
		else:
			print("Ошибка парсинга JSON")
			load_local_minerals()
	else:
		print("Ошибка HTTP: ", response_code)
		load_local_minerals()

func load_all_models():
	for mineral in minerals_data:
		download_model(mineral)

func download_model(mineral):
	var local_path = "user://models/" + mineral["model"]
	
	# Проверяем, есть ли файл локально
	if FileAccess.file_exists(local_path):
		print("Модель уже есть: ", mineral["name"])
		models_cache[mineral["id"]] = local_path
		load_model_to_scene(mineral)
		return	
	
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(_on_model_downloaded.bind(mineral))
	
	var url = server_url + "/download/" + str(int(mineral["id"]))
	var error = http_request.request(url)
	
	if error != OK:
		print("Ошибка скачивания модели: ", mineral["name"])
		

func _on_model_downloaded(result, response_code, headers, body, mineral):
	print("Скачиваю модель для: ", mineral["name"], " URL: ", server_url + "/download/" + str(int(mineral["id"])))
	if response_code == 200:
		# Создаем директорию если не существует
		var dir = DirAccess.open("user://")
		if not dir.dir_exists("models"):
			dir.make_dir("models")
		
		var file_path = "user://models/" + mineral["model"]
		print(file_path)
		var file = FileAccess.open(file_path, FileAccess.WRITE)
		if file:
			file.store_buffer(body)
			file.close()
			models_cache[mineral["id"]] = file_path
			print("Модель загружена: ", mineral["name"])
			load_model_to_scene(mineral)
		else:
			print("Ошибка сохранения файла: ", file_path)
	else:
		#print("Ошибка скачивания модели: ", mineral["id"])
		print("Ошибка скачивания модели. Код ответа: ", response_code)
		if mineral:
			print("Минерал: ", mineral.get("name", "неизвестно"))		
#
#func load_model_to_scene(mineral):
	#var model_path = models_cache.get(mineral["id"])
	#if model_path and FileAccess.file_exists(model_path):
		## Для GLB файлов используем load
		#var model_scene = load(model_path)
		#if model_scene:
			#var model_instance = model_scene.instantiate()
			#add_child(model_instance)
			#print("Модель добавлена: ", mineral["name"])
		#else:
			#print("Не удалось загрузить сцену: ", model_path)
			
func load_model_to_scene(mineral):
	var model_path = models_cache.get(mineral["id"])
	if model_path and FileAccess.file_exists(model_path):
		# Загружаем GLB как массив байт, а не как сцену
		var file = FileAccess.open(model_path, FileAccess.READ)
		if file:
			var buffer = file.get_buffer(file.get_length())
			file.close()
			
			# Создаем экземпляр GLTF документа
			var gltf = GLTFDocument.new()
			var state = GLTFState.new()
			var err = gltf.append_from_buffer(buffer, "", state)
			
			if err == OK:
				var scene = gltf.generate_scene(state)
				add_child(scene)
				print("Модель добавлена: ", mineral["name"])
				scene.position = Vector3(0, 0.524, 9.007) 
			else:
				print("Ошибка загрузки GLTF: ", err)

func load_local_minerals():
	minerals_data = [
		{"id": 1, "name": "Апатит", "description": "Описание апатита", "model": "apatit.glb", "num_shelf": 1, "num_position": 1},
		{"id": 2, "name": "Кварц", "description": "Описание кварца", "model": "kvarts.glb", "num_shelf": 1, "num_position": 2}
	]
	print("Загружены локальные данные")

func get_mineral_by_id(id):
	for mineral in minerals_data:
		if mineral["id"] == id:
			return mineral
	return null

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_room"): 
		change_panorama("res://assets/GS__0857.JPG")

func change_panorama(new_path: String) -> void:
	var texture = load(new_path)
	if texture:
		var sky_material = world_env.environment.sky.sky_material
		if sky_material is PanoramaSkyMaterial:
			sky_material.panorama = texture

func _on_viewport_2_din_3d_12_pointer_event(event: Variant) -> void:
	#mineral_id = 1 
	var mineral = get_mineral_by_id(1)
	if mineral and mineral_label_node:
		mineral_id = 1 #mineral_label_node.text = mineral["name"]

func _on_point_mineral_2_viewport_2_din_3d_pointer_event(event: Variant) -> void:
	#mineral_id = 2
	var mineral = get_mineral_by_id(2)
	if mineral and mineral_label_node:
		mineral_id = 2#mineral_label_node.text = mineral["name"]
