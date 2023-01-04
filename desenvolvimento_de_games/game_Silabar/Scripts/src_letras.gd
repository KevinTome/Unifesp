extends Panel
signal item_dropped_on_source(Draggable)
var draggable: PackedScene = preload("res://Draggable.tscn")
#class Draggable

onready var drop_target = get_node("../../UmaSilaba")
onready var drop_target_2a = get_node("../../DuasSilabas/TargetContainer2")
onready var drop_target_2b = get_node("../../DuasSilabas/TargetContainer3")
onready var drop_target_3a = get_node("../../TresSilabas/TargetContainer1")
onready var drop_target_3b = get_node("../../TresSilabas/TargetContainer2")
onready var drop_target_3c = get_node("../../TresSilabas/TargetContainer3")
onready var draggable_scene: PackedScene = preload("res://Draggable.tscn")
onready var draggable_container = $Padding/Rows

var dragables = [
			#{"id": 0, "label": "-"},
			{"id": 1, "label": "B"},
			{"id": 2, "label": "O"},
			{"id": 3, "label": "L"},
			{"id": 4, "label": "A"},
		]

func _ready() -> void:
	var nivel = get_tree().current_scene.filename

	print("NIVEL: ", nivel)
	match (nivel):
		"res://Niveis/nivel1_fase1.tscn":
			dragables = [
				{"id": 1, "label": "B"},
				{"id": 2, "label": "O"},
				{"id": 3, "label": "L"},
				{"id": 4, "label": "A"},
			]
		"res://Niveis/nivel1_fase2.tscn":
			dragables = [
				{"id": 1, "label": "J"},
				{"id": 2, "label": "O"},
				{"id": 3, "label": "G"},
				{"id": 4, "label": "O"},
			]
		"res://Niveis/nivel1_fase3.tscn":
			dragables = [
				{"id": 1, "label": "S"},
				{"id": 2, "label": "O"},
				{"id": 3, "label": "L"},
			]
		"res://Niveis/nivel2_fase1.tscn":
			dragables = [
				{"id": 1, "label": "P"},
				{"id": 2, "label": "A"},
				{"id": 3, "label": "I"},
			]
		"res://Niveis/nivel2_fase2.tscn":
			dragables = [
				{"id": 1, "label": "T"},
				{"id": 2, "label": "E"},
				{"id": 3, "label": "S"},
				{"id": 4, "label": "O"},
				{"id": 5, "label": "U"},
				{"id": 6, "label": "R"},
				{"id": 7, "label": "O"},
			]
		"res://Niveis/nivel2_fase3.tscn":
			dragables = [
				{"id": 1, "label": "F"},
				{"id": 2, "label": "L"},
				{"id": 3, "label": "O"},
				{"id": 4, "label": "R"},
			]
		"res://Niveis/nivel3_fase1.tscn":
			dragables = [
				{"id": 1, "label": "M"},
				{"id": 2, "label": "O"},
				{"id": 3, "label": "C"},
				{"id": 4, "label": "H"},
				{"id": 5, "label": "I"},
				{"id": 6, "label": "L"},
				{"id": 7, "label": "A"}
			]
		"res://Niveis/nivel3_fase2.tscn":
			dragables = [
				{"id": 1, "label": "S"},
				{"id": 2, "label": "A"},
				{"id": 3, "label": "U"},
				{"id": 4, "label": "D"},
				{"id": 5, "label": "E"}
			]
		"res://Niveis/nivel3_fase3.tscn":
			dragables = [
				{"id": 1, "label": "I"},
				{"id": 2, "label": "D"},
				{"id": 3, "label": "E"},
				{"id": 4, "label": "I"},
				{"id": 5, "label": "A"}
			]
				
	drop_target.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_2a.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_2b.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_3a.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_3b.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_3c.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	
	_populate_dragables()

func _populate_dragables():
	for dragable in dragables:
		var drag_item = draggable_scene.instance()
		drag_item.id = dragable["id"]
		drag_item.label = dragable["label"]
		draggable_container.add_child(drag_item)

func on_item_dropped_on_target(dropped_item: Draggable) -> void:
	for drag_item in draggable_container.get_children():
		drag_item = (drag_item as Draggable)
		if drag_item.id == dropped_item.id && dropped_item.id!=0:
			draggable_container.remove_child(drag_item)
			drag_item.queue_free()
			break


##
#func _on_TargetContainer_item_dropped_on_target(dropped_item: Draggable)->void:
#	for drag_item in draggable_container.get_children():
#		drag_item = (drag_item as Draggable)
#		if drag_item.id == dropped_item.id && dropped_item.id!=0:
#			draggable_container.remove_child(drag_item)
#			drag_item.queue_free()
#			break


func can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[SourceContainer] can_drop_data has run, returning %s" % can_drop)
	return can_drop

func drop_data(position: Vector2, data) -> void:
	print("[SourceContainer] drop_data has run")
	print("[SourceContainer] Emiting signal: item_dropped_on_target")

	var draggable_copy: TextureRect = draggable.instance()
	draggable_copy.id = data.id
	draggable_copy.label = data.label
	draggable_copy.dropped_on_target = false # diable furhter dragging
	
	var name = $".".name
	var source = $".".get_child(0).get_child(0)
	print("src -> targer: ", name," -> ", draggable_container.name)
	source.add_child(draggable_copy)
	
	emit_signal("item_dropped_on_source", data)
