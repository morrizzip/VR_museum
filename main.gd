extends Node3D

@onready var world_env: WorldEnvironment = $WorldEnvironment  # путь к вашему узлу

		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
