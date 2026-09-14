extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var texture_rect: TextureRect = $TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_path())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_instruction(name_instruction: String) -> void:
	color_rect.visible = false
	texture_rect.visible = true
	texture_rect.texture = load("res://images_instruction/" + name_instruction)
