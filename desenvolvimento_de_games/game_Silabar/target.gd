extends Panel
signal item_dropped_on_target(draggable)
var draggable: PackedScene = preload("res://Draggable.tscn")

func can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[TargetContainer] can_drop_data has run, returning %s" % can_drop)
	return can_drop

func drop_data(position: Vector2, data) -> void:
	print("[TargetContainer] drop_data has run")
	print("[TargetContainer] Emiting signal: item_dropped_on_target")

	var draggable_copy: TextureRect = draggable.instance()
	draggable_copy.id = data.id
	draggable_copy.label = data.label
	draggable_copy.dropped_on_target = true # diable furhter dragging
	$Padding/TargetContainer.add_child(draggable_copy)

	emit_signal("item_dropped_on_target", data)
