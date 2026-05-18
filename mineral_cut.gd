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

@onready var fluorite_pick: XRToolsPickable = $fluorite_pick
@onready var fluorite_first_part: XRToolsPickable = $fluorite_first_part
@onready var fluorite_second_part: XRToolsPickable = $fluorite_second_part
@onready var hci_water: CSGCylinder3D = $HCI_water
@onready var hci_bubble: CSGSphere3D = $hci_bubble
@onready var hci_bubble_2: CSGSphere3D = $hci_bubble2
@onready var hci_bubble_3: CSGSphere3D = $hci_bubble3
@onready var hci_bubble_4: CSGSphere3D = $hci_bubble4
@onready var hci_bubble_5: CSGSphere3D = $hci_bubble5

@onready var label_menu: Label = $Label
@onready var instruction_canvas_layer: CanvasLayer = $CanvasLayer

@onready var polevoy_shpat: Node3D = $ftorapatit_pick/polevoy_shpat

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_player_3: AnimationPlayer = $AnimationPlayer3
@onready var bottle_2_pick: XRToolsPickable = $bottle2_pick
@onready var oh_water: CSGCylinder3D = $OH_water
@onready var halite_clay: Node3D = $halite_pick/halite_clay
@onready var halite_pick: XRToolsPickable = $halite_pick
@onready var halite_first_part: XRToolsPickable = $halite_first_part
@onready var halite_second_part: XRToolsPickable = $halite_second_part

var fluorite_in_area = false
var polevoy_shpat_cut = false
var calcit_cut = false

var halite_in_area = false
var clay_cut = false

var ftorapatit_grab = false
var fluorite_grab = false

var ftorapatit_start_pos: Vector3
var fluorite_start_pos: Vector3
var fluorite_start_rotate: Vector3
var polevoy_shpat_start_pos: Vector3
var polevoy_shpat_start_rotate: Vector3
var calcit_start_pos: Vector3
var bottle_start_pos: Vector3
var bottle_start_rotate: Vector3

var fluorite_cut = false
@onready var viewport_2_din_3d: XRToolsViewport2DIn3D = $Viewport2Din3D
#@onready var canvas_instruction: CanvasLayer = viewport_2_din_3d.get_viewport().get_child(0).get_node("CanvasLayer")

@onready var canvas_instruction: CanvasLayer = get_node("/root/mineral_cut/Viewport2Din3D/Viewport/CanvasLayer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ftorapatit_start_pos = ftorapatit_pick.global_position
	fluorite_start_pos = fluorite_pick.global_position
	polevoy_shpat_start_pos = polevoy_shpat.global_position
	polevoy_shpat_start_rotate = polevoy_shpat.global_rotation
	calcit_start_pos = calcit_2.global_position
	bottle_start_pos = bottle_pick.global_position
	bottle_start_rotate = bottle_pick.global_rotation
	fluorite_start_rotate = fluorite_pick.global_rotation
	
	await get_tree().create_timer(10.0).timeout
	label_menu.visible = false
	
	
	
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
	if polevoy_shpat_cut == true:
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
	fluorite_first_part.visible = false
	fluorite_second_part.visible = false	
	animation_player.play("water_drop_animation")

	ftorapatit_grab = true
	if fluorite_grab == true:
		fluorite_pick.global_position = fluorite_start_pos
		fluorite_pick.global_rotation = fluorite_start_rotate
		fluorite_pick.visible = true		
		
		
		fluorite_grab = false
		calcit_cut = false
		bottle_pick.visible = true
		bottle_pick.global_position = bottle_start_pos
		bottle_pick.global_rotation = bottle_start_rotate
		calcit_2.visible = true
		calcit_2.global_position = calcit_start_pos
		fluorite_in_area = false
		
	canvas_instruction.set_instruction("instruction1_cut.png")
		
func _on_area_3d_bucket_area_entered(area: Area3D) -> void:
	
	print(area.name)
	if area.name == 'fluorite_area':
		fluorite_in_area = true
	
	if area.name == 'halite_area':
		halite_in_area = true		
		
	if area.name == 'bottle_acid_area' and fluorite_in_area == true:
		bottle_pick.visible = false

		hci_water.visible = true
		
		animation_player_3.play('hci_bubble_anim')	
		hci_bubble.visible = true	
		hci_bubble_2.visible = true
		hci_bubble_3.visible = true
		hci_bubble_4.visible = true
		hci_bubble_5.visible = true
		
		calcit_2.visible = false
		calcit_cut = true		
		
	if area.name == 'bottle_oh_area' and halite_in_area == true:
		bottle_2_pick.visible = false

		oh_water.visible = true
		
		#animation_player_3.play('hci_bubble_anim')	
		#hci_bubble.visible = true	
		#hci_bubble_2.visible = true
		#hci_bubble_3.visible = true
		#hci_bubble_4.visible = true
		#hci_bubble_5.visible = true
		
		halite_clay.visible = false
		clay_cut = true				
		
func _on_saw_disk_4_area_area_entered(area: Area3D) -> void:
	print(area.name)
	if area.name == 'polevoy_shpat_area':
		polevoy_shpat.visible = false
		polevoy_shpat_cut = true


func _on_fluorite_pick_dropped(pickable: Variant) -> void:
	if calcit_cut == true:
		fluorite_pick.visible = false
		fluorite_first_part.visible = true
		fluorite_second_part.visible = true
		hci_water.visible = false
		#animation_player_3.stop()
		fluorite_cut = true
		
func _on_fluorite_pick_grabbed(pickable: Variant, by: Variant) -> void:
	apatit_first_part.visible = false
	apatit_second_part.visible = false
	
	fluorite_grab = true
	if ftorapatit_grab == true:
		ftorapatit_pick.global_position = ftorapatit_start_pos
		ftorapatit_pick.visible = true	
		polevoy_shpat.visible = true
		polevoy_shpat.global_position = polevoy_shpat_start_pos			
		polevoy_shpat.global_rotation = polevoy_shpat_start_rotate		
		
		ftorapatit_grab = false
		polevoy_shpat_cut = false
	
	canvas_instruction.set_instruction("instruction_fluorite_cut2.png")

func _on_bubble_area_area_entered(area: Area3D) -> void:
	print(area.name)
	if area.name == 'hci_bubble_area':
		hci_bubble.visible = false
		#water_drop.global_position = Vector3(4.187, 1.914, 2.132)
	if area.name == 'hci_bubble2_area':
		hci_bubble_2.visible = false
		#water_drop_2.global_position = Vector3(4.144, 1.942, 2.132)
	if area.name == 'hci_bubble3_area':
		hci_bubble_3.visible = false
		#water_drop_3.global_position = Vector3(4.242, 1.929, 2.132)
	if area.name == 'hci_bubble4_area':
		hci_bubble_4.visible = false
	if area.name == 'hci_bubble5_area':
		hci_bubble_5.visible = false	
		animation_player_3.stop() 
		#water_drop_4.global_position = Vector3(4.208, 1.942, 2.132)

		await get_tree().create_timer(1.0).timeout

		# Сбросить позиции на стартовые
		#water_drop.global_position = Vector3(4.187, 1.914, 2.132)
		#water_drop_2.global_position = Vector3(4.144, 1.942, 2.132)
		#water_drop_3.global_position = Vector3(4.242, 1.929, 2.132)
		#water_drop_4.global_position = Vector3(4.208, 1.942, 2.132)
		if fluorite_cut == false:
			animation_player_3.play("hci_bubble_anim")
			hci_bubble.visible = true
			hci_bubble_2.visible = true
			hci_bubble_3.visible = true
			hci_bubble_4.visible = true
			hci_bubble_5.visible = true
		else:
			animation_player_3.stop()
			hci_bubble.visible = false
			hci_bubble_2.visible = false
			hci_bubble_3.visible = false
			hci_bubble_4.visible = false
			hci_bubble_5.visible = false

func _on_halite_pick_dropped(pickable: Variant) -> void:
	if clay_cut == true:
		halite_pick.visible = false
		
		halite_first_part.visible = true
		halite_second_part.visible = true
		oh_water.visible = false


func _on_halite_pick_grabbed(pickable: Variant, by: Variant) -> void:
	canvas_instruction.set_instruction("instruction3_halite_cut.png")
