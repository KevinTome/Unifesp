extends Panel
signal item_dropped_on_target(Draggable)
var draggable: PackedScene = preload("res://Draggable.tscn")

#onready var tc02a = get_node("../HBoxContainer/TargetContainer3/Padding/TargetContainer_02a")
#onready var tc02b = get_node("../HBoxContainer/TargetContainer3/Padding/TargetContainer_02b")
onready var draggable_container_1silaba = $Padding/TargetContainer_01
onready var draggable_container_2silabas_a = $"../HBoxContainer/TargetContainer2/Padding/TargetContainer_02a"
onready var draggable_container_2silabas_b = $"../HBoxContainer/TargetContainer3/Padding/TargetContainer_02b"

var id = 0
var mouseid=-1

func _ready() -> void:
	#$".".GetChild().GetChild().GetChild().connect("MouseOver", self, "on_MouseOver")
	$".".get_child(0).get_child(0).connect("MouseOver", self, "on_MouseOver")
func _input(event):
	if event is InputEventMouseButton:
		print("mouse click")
		print(mouseid)
		if(!(mouseid==-1)):
			print(mouseid)

func on_MouseOver(mouse_id: int) -> void:
	mouseid = -1


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

	print(id)
	
	var name = $".".name
	print(name)
	if(name == "TargetContainer"):
		$Padding/TargetContainer_01.add_child(draggable_copy)
	if(name == "TargetContainer2"):
		$"Padding/TargetContainer_02a".add_child(draggable_copy)
	if(name == "TargetContainer3"):
		$"Padding/TargetContainer_02b".add_child(draggable_copy)

	emit_signal("item_dropped_on_target", data)


func _on_OptionButton_item_selected(index):
	var old_id = id
	id = index
	print(id)
	
	#if(old_id == 0):
	#	print("Matando child de ", old_id)
	#	for drag_item in draggable_container_1silaba.get_children():
	#		if !drag_item:
	#			drag_item = (drag_item as Draggable)
	#			draggable_container_1silaba.remove_child(drag_item)
	#			drag_item.queue_free()
	#			break

