extends Panel

var target_container = preload("res://Scenes/TargetContainer.tscn")


func _on_SilabasOptionButton_item_selected(index):
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()
	
	var horizontal_area = self.get_rect().size[0]
	
	var space_between_container = 20
	var target_container_size = Vector2(((horizontal_area / (index+1)) - ((space_between_container*index)/(index+1))), 100)

	for i in (index+1):
		var target_control_instance = target_container.instance()
		target_control_instance.name = ("TargetContainer" + str(i+1))
		
		target_control_instance.set_size(target_container_size)
		var position = Vector2((target_container_size[0] + 20)*i, 0)
		target_control_instance.set_position(position)
		
		target_control_instance.get_node("TargetContainer").set_size(target_container_size)
		target_control_instance.get_node("TargetPanel").set_size(target_container_size)
		self.add_child(target_control_instance)
