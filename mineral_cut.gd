extends Node3D
@onready var ftorapatit_pick: XRToolsPickable = $ftorapatit_pick
@onready var apatit_first_part: XRToolsPickable = $apatit_first_part

@onready var apatit_second_part: XRToolsPickable = $apatit_second_part

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ftorapatit_pick_dropped(pickable: Variant) -> void:
	ftorapatit_pick.visible = false
	
	apatit_first_part.visible = true
	apatit_second_part.visible = true
