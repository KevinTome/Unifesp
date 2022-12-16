extends TextureRect

class_name Draggable

var id: int
var label: String
# set this to true once we've been dropped on our target
var dropped_on_target: bool = false
var mouse_id: int

signal MouseOver(mouse_id)

func _ready() -> void:
	mouse_id=-1
	add_to_group("DRAGGABLE")
	$Label.text = label
	$".".rect_scale = Vector2(0.375,0.375)
	
	
func get_drag_data(_position: Vector2):
	print("[Draggable] get_drag_data has run")
	#if not dropped_on_target:
	set_drag_preview(_get_preview_control())
	return self


func _on_item_dropped_on_target(draggable):
	print("[Draggable] Signal item_dropped_on_target received")
	if draggable.get("id") != id:
		return
	print("[Draggable] Iven been dropped, removing myself from source container")
	queue_free()


func _get_preview_control() -> Control:
	"""
	The preview control must not be in the scene tree. You should not free the control, and
	you should not keep a reference to the control beyond the duration of the drag.
	It will be deleted automatically after the drag has ended.
	"""
	var preview = TextureRect.new()
	preview.rect_size = rect_size
	var preview_image = Texture
	#preview_image.a = .5
	preview.texture = texture
	preview.set_rotation(.1) # in readians
	return preview


##Monitor para ver se o mouse está em cima de qual caixa. Não funciona.
func _on_Area_mouse_entered():
	mouse_id=id
	print("mouse over")
	emit_signal("MouseOver", id)
	
func _on_Area_mouse_exited():
	mouse_id=-1
	print("mouse left")
	emit_signal("MouseOver", id)
