extends Node3D
@onready var ftorapatit_pick: XRToolsPickable = $ftorapatit_pick
@onready var apatit_first_part: XRToolsPickable = $apatit_first_part

@onready var apatit_second_part: XRToolsPickable = $apatit_second_part
@onready var water_drop: Node3D = $water_drop
@onready var water_drop_2: Node3D = $water_drop2
@onready var water_drop_3: Node3D = $water_drop3
@onready var water_drop_4: Node3D = $water_drop4

@onready var bottle_pick: XRToolsPickable = $bottle_pick
@onready var calcit_2: Node3D = $fluorite_pick/calcit2

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var fluorite_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if water_drop_4.global_position == Vector3(4.208, 1.942, 2.132):
		#water_drop_4.visible = true
		#water_drop_3.visible = true
		#water_drop_2.visible = true
		#water_drop.visible = true
		#animation_player.play("water_drop_animation")



func _on_ftorapatit_pick_dropped(pickable: Variant) -> void:
	ftorapatit_pick.visible = false
	
	apatit_first_part.visible = true
	apatit_second_part.visible = true
	


func _on_area_3d_body_entered(body: Node3D) -> void:
#print(body.name)
	pass


func _on_area_3d_area_entered(area: Area3D) -> void:
	print(area.name)
	if area.name == 'water_drop_area':
		water_drop.visible = false
		#water_drop.global_position = Vector3(4.187, 1.914, 2.132)
	if area.name == 'water_drop2_area':
		water_drop_2.visible = false
		#water_drop_2.global_position = Vector3(4.144, 1.942, 2.132)
	if area.name == 'water_drop3_area':
		water_drop_3.visible = false
		#water_drop_3.global_position = Vector3(4.242, 1.929, 2.132)
	if area.name == 'water_drop4_area':
		water_drop_4.visible = false
		animation_player.stop() 
		#water_drop_4.global_position = Vector3(4.208, 1.942, 2.132)

		await get_tree().create_timer(1.0).timeout
		water_drop.visible = true
		water_drop_2.visible = true
		water_drop_3.visible = true
		water_drop_4.visible = true
		# Сбросить позиции на стартовые
		#water_drop.global_position = Vector3(4.187, 1.914, 2.132)
		#water_drop_2.global_position = Vector3(4.144, 1.942, 2.132)
		#water_drop_3.global_position = Vector3(4.242, 1.929, 2.132)
		#water_drop_4.global_position = Vector3(4.208, 1.942, 2.132)
		animation_player.play("water_drop_animation")

		#water_drop_4.visible = true
		#water_drop_3.visible = true
		#water_drop_2.visible = true
		#water_drop.visible = true
		#animation_player.play("water_drop_animation")


func _on_ftorapatit_pick_grabbed(pickable: Variant, by: Variant) -> void:
	animation_player.play("water_drop_animation")


func _on_area_3d_bucket_area_entered(area: Area3D) -> void:
	
	print(area.name)
	if area.name == 'fluorite_area':
		fluorite_in_area = true
		
	if area.name == 'bottle_acid_area' and fluorite_in_area == true:
		bottle_pick.visible = false
		calcit_2.visible = false
