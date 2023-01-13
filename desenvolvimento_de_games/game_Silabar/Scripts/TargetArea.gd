extends Panel

var target_container = preload("res://Scenes/TargetContainer.tscn")
const TARGET_CONTAINER_SPACE = 20

signal item_dropped_on_target_area

func render_target_containers(total):
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()
	
	for index in (total):
		var horizontal_area = self.get_rect().size[0]
		var target_container_size = Vector2(((horizontal_area / (total)) - ((TARGET_CONTAINER_SPACE*(total-1))/(total))), 100)	
		
		var target_control_instance = target_container.instance()
		target_control_instance.name = ("TargetControl" + str(index+1))
		target_control_instance.set_size(target_container_size)
		
		var position = Vector2((target_container_size[0] + 20)*index, 0)
		target_control_instance.set_position(position)
		
		target_control_instance.get_node("TargetContainer").set_size(Vector2(target_container_size[0], 100))
		target_control_instance.get_node("TargetContainer").id = index
		target_control_instance.get_node("TargetBorder").set_size(target_container_size)
		target_control_instance.get_node("TargetContainerPanel").set_size(target_container_size)
		target_control_instance.get_node("Pontilhado").set_size(Vector2(target_container_size[0], 200))
		
		target_control_instance.get_node("TargetContainer").connect("item_dropped_on_target", self.get_parent().get_node("DragContainer"), "on_item_dropped_on_target")
		self.get_parent().get_node("DragContainer").connect("item_dropped_on_source", target_control_instance.get_node("TargetContainer"), "_on_item_dropped_on_source")
		target_control_instance.get_node("TargetContainer").connect("item_to_be_dropped_on_target", self, "on_item_to_be_dropped_on_target")
		
		self.add_child(target_control_instance)

func _ready():
	render_target_containers(1)

func _on_SilabasOptionButton_item_selected(index):
	render_target_containers(index+1)
	
func on_item_to_be_dropped_on_target(dropped_item: Draggable, target_container):
	if(target_container.get_node(String(dropped_item.id)) == null):
		for child in self.get_children():
			var drag = child.get_node("TargetContainer" + "/" + String(dropped_item.id))
			if(drag != null):
				child.remove_child(drag)
				drag.queue_free()
	#for i in self.get_children():
		
		

