extends HBoxContainer
signal item_dropped_on_target(Draggable)
var draggable = preload("res://Scenes/Draggable.tscn")

signal update_answer

var id = 0
var mouseid=-1


func can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	return can_drop


func drop_data(position: Vector2, data) -> void:	
	emit_signal("update_answer", data.label, 0)
	
	var draggable_instance = draggable.instance()
	draggable_instance.id = data.id
	draggable_instance.label = data.label
	
	# draggable_instance.set_size(Vector2(500, 500))
	draggable_instance.dropped_on_target = false # diable furhter dragging
	
	self.connect("item_dropped_on_target", get_parent().get_parent().get_parent().get_node("ContainerOrigem/SourceContainer"), "on_item_dropped_on_target")
	self.add_child(draggable_instance)
	
	emit_signal("item_dropped_on_target", data)

"""
func _on_OptionButton_item_selected(index):
	var old_id = id
	id = index
	print(id)
"""	

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
"""	
	
