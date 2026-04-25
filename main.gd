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
@onready var panel_4: Node3D = $panel4

#points
@onready var point_mineral_2_viewport_2_din_3d: XRToolsViewport2DIn3D = $point_mineral2_Viewport2Din3D
@onready var point_mineral_3_viewport_2_din_3d: XRToolsViewport2DIn3D = $point_mineral3_Viewport2Din3D
@onready var point_mineral_4_viewport_2_din_3d: XRToolsViewport2DIn3D = $point_mineral4_Viewport2Din3D
@onready var point_mineral_5_viewport_2_din_3d: XRToolsViewport2DIn3D = $point_mineral5_Viewport2Din3D
@onready var point_mineral_6_viewport_2_din_3d: XRToolsViewport2DIn3D = $point_mineral6_Viewport2Din3D


@onready var arrow_13_viewport_2_din_3d_15: XRToolsViewport2DIn3D = $arrow_13_Viewport2Din3D15
@onready var arrow_14_viewport_2_din_3d_16: XRToolsViewport2DIn3D = $arrow_14_Viewport2Din3D16
@onready var arrow_15_viewport_2_din_3d_17: XRToolsViewport2DIn3D = $arrow_15_Viewport2Din3D17
@onready var arrow_16_viewport_2_din_3d_18: XRToolsViewport2DIn3D = $arrow_16_Viewport2Din3D18
@onready var arrow_17_viewport_2_din_3d_19: XRToolsViewport2DIn3D = $arrow_17_Viewport2Din3D19
@onready var arrow_18_viewport_2_din_3d_20: XRToolsViewport2DIn3D = $arrow_18_Viewport2Din3D20
@onready var arrow_19_viewport_2_din_3d_21: XRToolsViewport2DIn3D = $arrow_19_Viewport2Din3D21
@onready var arrow_20_viewport_2_din_3d_22: XRToolsViewport2DIn3D = $arrow_20_Viewport2Din3D22
@onready var arrow_21_viewport_2_din_3d_23: XRToolsViewport2DIn3D = $arrow_21_Viewport2Din3D23
@onready var arrow_22_viewport_2_din_3d_24: XRToolsViewport2DIn3D = $arrow_22_Viewport2Din3D24
@onready var arrow_23_viewport_2_din_3d_25: XRToolsViewport2DIn3D = $arrow_23_Viewport2Din3D25
@onready var arrow_24_viewport_2_din_3d_26: XRToolsViewport2DIn3D = $arrow_24_Viewport2Din3D26

#arrows_back
@onready var arrow_back_1_viewport_2_din_3d: XRToolsViewport2DIn3D = $arrow_back1_Viewport2Din3D
@onready var arrow_back_2_viewport_2_din_3d: XRToolsViewport2DIn3D = $arrow_back2_Viewport2Din3D
@onready var arrow_back_3_viewport_2_din_3d: XRToolsViewport2DIn3D = $arrow_back3_Viewport2Din3D


@onready var mineral_label_node: Label = viewport_2_din_3d_13.get_node("Viewport/CanvasLayer/Control/Label")
@onready var mineral_label8_node: Label = viewport_2_din_3d_13.get_node("Viewport/CanvasLayer/Control/Label8")
@onready var mineral_label6_node: Label = viewport_2_din_3d_13.get_node("Viewport/CanvasLayer/Control/Label6")

#@onready var icon_canvas: CanvasLayer = viewport_2_din_3d_12.get_node("Viewport/CanvasLayer")

var mineral_id = 0
var select_mineral_id = 0
var arrow_id = 0

#var vector_location_mineral = Vector3(-0.651, -0.237, 1.879)
var vector_location_mineral = Vector3(-0.883, -0.44, 1.879)
var current_pickable = null
#var server_url = "http://192.168.1.10:5000"
var server_url = "http://localhost:5000"
var minerals_data = []
var models_cache = {}

#Вращение минерала
var rotation_speed = 1.5
var rotation_amplitude = 0.3
var rotation_time = 0.0

var is_picked = false

#func _process(delta: float) -> void:
	#if current_pickable and current_pickable.get_meta("rotate_anim", false):
		#rotation_time += delta
		## Плавное вращение влево-вправо
		#var angle = sin(rotation_time * rotation_speed) * rotation_amplitude
		#current_pickable.rotation.y = current_pickable.get_meta("original_rotation") + angle

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
	viewport_2_din_3d_13.visible = false 		
	pickable_object.visible = false
	panel_4.visible = false	
	point_mineral_2_viewport_2_din_3d.visible = false
	arrow_13_viewport_2_din_3d_15.visible = false
	arrow_14_viewport_2_din_3d_16.visible = false
	arrow_15_viewport_2_din_3d_17.visible = false
	arrow_16_viewport_2_din_3d_18.visible = false
	arrow_17_viewport_2_din_3d_19.visible = false
	arrow_18_viewport_2_din_3d_20.visible = false
	arrow_19_viewport_2_din_3d_21.visible = false
	arrow_20_viewport_2_din_3d_22.visible = false
	arrow_21_viewport_2_din_3d_23.visible = false
	arrow_22_viewport_2_din_3d_24.visible = false
	arrow_23_viewport_2_din_3d_25.visible = false
	arrow_24_viewport_2_din_3d_26.visible = false
	arrow_back_1_viewport_2_din_3d.visible = false
	arrow_back_2_viewport_2_din_3d.visible = false
	arrow_back_3_viewport_2_din_3d.visible = false
	
	point_mineral_3_viewport_2_din_3d.visible = false
	point_mineral_4_viewport_2_din_3d.visible = false
	point_mineral_5_viewport_2_din_3d.visible = false
	point_mineral_6_viewport_2_din_3d.visible = false
	
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
	print("Данные минералов загружены. Готово к загрузке по запросу.")
	#for mineral in minerals_data:
		#download_model(mineral)

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
			#
			
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
				
				var new_pickable = pickable_object.duplicate()
				
				new_pickable.get_node("apatit").queue_free()
				new_pickable.add_child(scene)
		
				#new_pickable.position = Vector3(-0.651, -0.237, 1.879)
				new_pickable.position = vector_location_mineral
				new_pickable.scale = Vector3(0.2, 0.2, 0.2)

				#if new_pickable.has_signal("picked_up"):
				#new_pickable.picked_up.connect(_on_pickable_picked_up)
				#if new_pickable.has_signal("dropped"):
				#new_pickable.dropped.connect(_on_pickable_dropped)

 				# Добавляем уникальный идентификатор для анимации
				new_pickable.set_meta("rotate_anim", true)
				new_pickable.set_meta("original_rotation", new_pickable.rotation.y)				
				new_pickable.set_meta("original_position", vector_location_mineral)  # Добавьте эту строку
				
				if current_pickable:
					current_pickable.visible = false
				
				new_pickable.visible = true
				add_child(new_pickable)		
				current_pickable = new_pickable
				set_label_text(mineral)		
			else:
				print("Ошибка загрузки GLTF: ", err)
		

func load_local_minerals():
	minerals_data = [
		{"id": 1, "name": "Апатит", "description": "Описание апатита", "model": "apatit.glb", "id_rack": 1, "num_shelf": 1, "num_position": 1},
		{"id": 2, "name": "Кварц", "description": "Описание кварца", "model": "kvarts.glb", "id_rack": 2, "num_shelf": 1, "num_position": 2}
	]
	print("Загружены локальные данные")

func get_mineral_by_id(id):
	for mineral in minerals_data:
		if mineral["id"] == id:
			return mineral
	return null

func get_mineral_by_location(rack_id: int, shelf: int, position: int):
	for mineral in minerals_data:
		if mineral["id_rack"] == rack_id and mineral["num_shelf"] == shelf and mineral["num_position"] == position:
			return mineral
	return null
	
func load_mineral_by_location(rack_id: int, shelf: int, position: int):
	var mineralnew# = get_mineral_by_location(rack_id, shelf, position)
	for mineral in minerals_data:
		if mineral["id_rack"] == rack_id and mineral["num_shelf"] == shelf and mineral["num_position"] == position:
			mineralnew = mineral
	if mineralnew:
		print("Загружаю минерал: ", mineralnew["name"])
		var local_path = "user://models/" + mineralnew["model"]
		
		if FileAccess.file_exists(local_path):
			print("Модель уже скачана: ", mineralnew["name"])
			models_cache[mineralnew["id"]] = local_path
			load_model_to_scene(mineralnew)
		else:
			print("Скачиваю модель: ", mineralnew["name"])
			download_model(mineralnew)
	else:
		print("Минерал на стеллаже ", rack_id, ", полка ", shelf, ", позиция ", position, " не найден")

var last_position = Vector3.ZERO
var stop_timer = 0.0
var stop_delay = 1.5  # Задержка 1.5 секунды после остановки
var return_timer = 0.0
var return_delay = 3.0
var original_position = Vector3.ZERO

func _process(delta: float) -> void:
	if current_pickable and current_pickable.get_meta("rotate_anim", false):
		
		var current_position = current_pickable.global_position
		var is_moving = current_position.distance_to(last_position) > 0.001
		last_position = current_position
		
		if is_moving:
			# Объект движется - сбрасываем таймер
			stop_timer = stop_delay
			return_timer = 0  # Сбрасываем таймер возврата
			rotation_time = 0
			current_pickable.set_meta("original_rotation", current_pickable.rotation.y)
		elif stop_timer > 0:
			# Объект остановился, но ждем
			stop_timer -= delta
		else:
			# Объект неподвижен и таймер прошел - анимируем
			rotation_time += delta
			var angle = sin(rotation_time * rotation_speed) * rotation_amplitude
			current_pickable.rotation.y = current_pickable.get_meta("original_rotation") + angle		
		
			# Таймер возврата на место
			return_timer += delta
			if return_timer >= return_delay:
				current_pickable.position = vector_location_mineral
				return_timer = 0
		
		#if not is_moving:		
			#rotation_time += delta
			## Плавное вращение влево-вправо
			#var angle = sin(rotation_time * rotation_speed) * rotation_amplitude
			#current_pickable.rotation.y = current_pickable.get_meta("original_rotation") + angle
		#else:
			## Обновляем базовый поворот при движении
			#current_pickable.set_meta("original_rotation", current_pickable.rotation.y)
			#rotation_time = 0
			
			
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_room"): 
		change_panorama("res://assets/GS__0857.JPG")

func change_panorama(new_path: String) -> void:
	var texture = load(new_path)
	if texture:
		var sky_material = world_env.environment.sky.sky_material
		if sky_material is PanoramaSkyMaterial:
			sky_material.panorama = texture

func set_label_text(mineral):
	mineral_label_node.text = mineral["name"]
	#mineral_label8_node.text = mineral["name"] -- формулы пока нет
	mineral_label6_node.text = mineral["description"]

func set_select_mineral(select_id: String):
	select_mineral_id = select_id

#func _on_pickable_picked_up():
	#print("захвачен")
	#is_picked = true
#
#func _on_pickable_dropped():
	#print("отпущен")
	#is_picked = false

func _on_viewport_2_din_3d_12_pointer_event(event: Variant) -> void:
	#var mineral = get_mineral_by_location(1, 2, 5)
	#mineral.visible = true
	#load_mineral_by_location(1, 2, 5)
	#var mineral = get_mineral_by_id(1)
	#if mineral and mineral_label_node:
	mineral_id = 1
	
func _on_point_mineral_2_viewport_2_din_3d_pointer_event(event: Variant) -> void:
	#var mineral = get_mineral_by_id(2)
	#if mineral and mineral_label_node:
	mineral_id = 2

func _on_arrow_12_viewport_2_din_3d_14_pointer_event(event: Variant) -> void:
	arrow_id = 12

func _on_arrow_10_viewport_2_din_3d_10_pointer_event(event: Variant) -> void:
	arrow_id = 10

func _on_arrow_13_viewport_2_din_3d_15_pointer_event(event: Variant) -> void:
	arrow_id = 13

func _on_arrow_14_viewport_2_din_3d_16_pointer_event(event: Variant) -> void:
	arrow_id = 14

func _on_arrow_15_viewport_2_din_3d_17_pointer_event(event: Variant) -> void:
	arrow_id = 15

func _on_arrow_16_viewport_2_din_3d_18_pointer_event(event: Variant) -> void:
	arrow_id = 16

func _on_arrow_17_viewport_2_din_3d_19_pointer_event(event: Variant) -> void:
	arrow_id = 17

func _on_arrow_18_viewport_2_din_3d_20_pointer_event(event: Variant) -> void:
	arrow_id = 18


func _on_arrow_19_viewport_2_din_3d_21_pointer_event(event: Variant) -> void:
	arrow_id = 19


func _on_arrow_20_viewport_2_din_3d_22_pointer_event(event: Variant) -> void:
	arrow_id = 20


func _on_arrow_21_viewport_2_din_3d_23_pointer_event(event: Variant) -> void:
	arrow_id = 21


func _on_arrow_22_viewport_2_din_3d_24_pointer_event(event: Variant) -> void:
	arrow_id = 22


func _on_arrow_23_viewport_2_din_3d_25_pointer_event(event: Variant) -> void:
	arrow_id = 23


func _on_arrow_24_viewport_2_din_3d_26_pointer_event(event: Variant) -> void:
	arrow_id = 24

func _on_arrow_back_1_viewport_2_din_3d_pointer_event(event: Variant) -> void:
	arrow_id = 25


func _on_arrow_back_2_viewport_2_din_3d_pointer_event(event: Variant) -> void:
	arrow_id = 26


func _on_point_mineral_5_viewport_2_din_3d_pointer_event(event: Variant) -> void:
	mineral_id = 3


func _on_point_mineral_6_viewport_2_din_3d_pointer_event(event: Variant) -> void:
	mineral_id = 4
