extends Panel
signal item_dropped_on_target(Draggable)
var draggable: PackedScene = preload("res://Scenes/Draggable.tscn")

signal update_answer

var id = 0
var mouseid=-1

"""
func can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[TargetContainer] can_drop_data has run, returning %s" % can_drop)
	return can_drop
"""	

func drop_data(position: Vector2, data) -> void:
	print("[TargetContainer] drop_data has run")
	print("[TargetContainer] Emiting signal: item_dropped_on_target")

	emit_signal("update_answer", data.label, 0)
	
	"""
	print(data)

	var draggable_copy: TextureRect = draggable.instance()
	draggable_copy.id = data.id
	draggable_copy.label = data.label
	draggable_copy.dropped_on_target = false # diable furhter dragging
	
	var name = $".".name
	var target = $".".get_child(0)#.get_child(0)
	print("name - childchild: ", name," -> ", target.name)
	target.add_child(draggable_copy)
	
	emit_signal("item_dropped_on_target", data)
	"""

"""
func _on_OptionButton_item_selected(index):
	var old_id = id
	id = index
	print(id)
"""	

func _on_SourceContainer_item_dropped_on_source(dropped_item: Draggable) -> void:
	var name = $".".name
	var draggable_container = $".".get_child(0)#.get_child(0)
	print("[source]:" ,name)
	print("[source child]:" ,draggable_container.name)
	
	for drag_item in draggable_container.get_children():
			drag_item = (drag_item as Draggable)
			if drag_item.id == dropped_item.id && dropped_item.id!=0:
				draggable_container.remove_child(drag_item)
				drag_item.queue_free()
				break
	
	
