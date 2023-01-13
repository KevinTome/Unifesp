extends TextureRect

class_name Draggable

var id: int
var label: String
var mouse_id: int

signal MouseOver(mouse_id)

func _ready() -> void:
	mouse_id=-1
	add_to_group("DRAGGABLE")
	$Label.text = label
	
	
func get_drag_data(_position: Vector2):
	set_drag_preview(_get_preview_control())
	return self


func _on_item_dropped_on_target(draggable):
	print("AOBA")
	if draggable.get("id") != id:
		return
	queue_free()


func _get_preview_control() -> Control:
	"""
	The preview control must not be in the scene tree. You should not free the control, and
	you should not keep a reference to the control beyond the duration of the drag.
	It will be deleted automatically after the drag has ended.
	"""
	
	var preview = TextureRect.new()
	preview.rect_size = rect_size
	preview.texture = load("res://assets/blocos_64px/Letter.png")
	
	preview.add_child(Label.new())
	preview.get_child(0).text = self.label
	print(rect_size)
	preview.get_child(0).set_size(rect_size*1.2)
	preview.get_child(0).align = 1
	preview.get_child(0).valign = 1
	
	preview.set_rotation(.1) # in readians
	return preview
