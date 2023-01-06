extends HBoxContainer

var target_container = preload("res://Scenes/TargetContainer.tscn")

func _on_SilabasOptionButton_item_selected(index):
	for i in index:
		var target_container_instance = target_container.instance()
		target_container_instance.name = ("TargetContainer" + str(i))
		self.add_child(target_container_instance)
