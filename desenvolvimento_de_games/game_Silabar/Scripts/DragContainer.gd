extends ReferenceRect
onready var draggable_scene: PackedScene = preload("res://Scenes/Draggable.tscn")

signal item_dropped_on_source(Draggable)

var draggables = []

func _ready() -> void:
	_populate_dragables()

func _populate_dragables():
	for dragable in draggables:
		render_draggable(dragable["id"], dragable["label"])

func on_item_dropped_on_target(dropped_item: Draggable) -> void:
	for drag_item in self.get_node("HDragContainer").get_children():
		drag_item = (drag_item as Draggable)
		if drag_item.id == dropped_item.id:
			self.remove_child(drag_item)
			drag_item.queue_free()
			break

func can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	return can_drop

func render_draggable(id, label):
	var draggable_instance: TextureRect = draggable_scene.instance()
	draggable_instance.id = id
	draggable_instance.label = label
	draggable_instance.name = String(id)
	draggable_instance.rect_size = Vector2(63, 64)
	draggable_instance.rect_min_size = draggable_instance.rect_size * Vector2(0.8, 0.8)
	
	var source = self.get_node("HDragContainer")
	source.add_child(draggable_instance)

func drop_data(position: Vector2, data) -> void:
	if(self.get_node("HDragContainer/" + String(data.id)) == null):	
		render_draggable(data.id, data.label)
		emit_signal("item_dropped_on_source", data)

func _on_GameManager_set_current_word(new_word):
	var local_draggable = []

	for i in len(new_word):
		local_draggable.push_back({
			"id": i,
			"label": new_word[i].to_upper()
		})
		
	draggables = local_draggable


func _on_SilabasOptionButton_item_selected(index):
	for item in self.get_node("HDragContainer").get_children():
		self.get_node("HDragContainer").remove_child(item)
		item.queue_free()
	
	_populate_dragables()
