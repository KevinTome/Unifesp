extends Panel
signal item_dropped_on_source(Draggable)
var draggable: PackedScene = preload("res://Scenes/Draggable.tscn")

"""
onready var drop_target = get_node("../../UmaSilaba")
onready var drop_target_2a = get_node("../../DuasSilabas/TargetContainer2")
onready var drop_target_2b = get_node("../../DuasSilabas/TargetContainer3")
onready var drop_target_3a = get_node("../../TresSilabas/TargetContainer1")
onready var drop_target_3b = get_node("../../TresSilabas/TargetContainer2")
onready var drop_target_3c = get_node("../../TresSilabas/TargetContainer3")
"""
onready var draggable_scene: PackedScene = preload("res://Scenes/Draggable.tscn")
onready var draggable_container = $Padding/Rows

var dragables = []

func _ready() -> void:
	"""
	drop_target.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_2a.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_2b.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_3a.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_3b.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	drop_target_3c.connect("item_dropped_on_target", self, "on_item_dropped_on_target")
	"""
	
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

func _on_GameManager_set_current_word(new_word):
	var local_draggable = []

	for i in len(new_word):
		local_draggable.push_back({
			"id": 0,
			"label": new_word[i].to_upper()
		})
		
	dragables = local_draggable