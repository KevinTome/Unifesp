extends HBoxContainer
signal item_dropped_on_target(Draggable)
signal item_to_be_dropped_on_target(Draggable)
var draggable = preload("res://Scenes/Draggable.tscn")

signal update_answer

var id: int
var mouseid=-1

func can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	return can_drop and (self.get_child_count() <= 3)

func drop_data(position: Vector2, data) -> void:
	emit_signal("item_to_be_dropped_on_target", data, self)
	if(self.get_node(String(data.id)) == null):
		emit_signal("update_answer", data.label, 0)
		
		var draggable_instance: Draggable = draggable.instance()
		draggable_instance.id = data.id
		draggable_instance.name = String(data.id)
		draggable_instance.label = data.label
		draggable_instance.rect_size = Vector2(63, 64)
		draggable_instance.rect_min_size = draggable_instance.rect_size * Vector2(0.8, 0.8)
		
		self.add_child(draggable_instance)
		
		emit_signal("item_dropped_on_target", data)

"""
func _on_OptionButton_item_selected(index):
	var old_id = id
	id = index
	print(id)
"""	

func _on_item_dropped_on_source(dropped_item: Draggable) -> void:
	for drag_item in self.get_children():
		drag_item = (drag_item as Draggable)
		if drag_item.id == dropped_item.id:
			self.remove_child(drag_item)
			drag_item.queue_free()
			break	
	
