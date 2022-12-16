extends Panel
signal item_dropped_on_target(Draggable)
var draggable: PackedScene = preload("res://Draggable.tscn")

#onready var tc02a = get_node("../HBoxContainer/TargetContainer3/Padding/TargetContainer_02a")
#onready var tc02b = get_node("../HBoxContainer/TargetContainer3/Padding/TargetContainer_02b")
onready var draggable_container_1silaba = $Padding/ContainerAlvo_1_silaba
onready var draggable_container_2silabas_a = $"../DuasSilabas/TargetContainer2/Padding/ContainerAlvo_2_silabas_a"
onready var draggable_container_2silabas_b = $"../DuasSilabas/TargetContainer3/Padding/ContainerAlvo_2_silabas_b"

onready var sourcetarget = get_node("../ContainerOrigem/SourceContainer/Padding/Rows")

var id = 0
var mouseid=-1

func _ready() -> void:
	#$".".GetChild().GetChild().GetChild().connect("MouseOver", self, "on_MouseOver")
	#$".".get_child(0).get_child(0).connect("MouseOver", self, "on_MouseOver")
	#sourcetarget.connect("item_dropped_on_source", self, "on_item_dropped_on_source")
	
	pass
	
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
	draggable_copy.dropped_on_target = false # diable furhter dragging

	print(id)
	
	var name = $".".name
	var target = $".".get_child(0).get_child(0)
	print("name - childchild: ", name," -> ", target.name)
	target.add_child(draggable_copy)
	

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


func _on_SourceContainer_item_dropped_on_source(dropped_item: Draggable) -> void:
	var name = $".".name
	var draggable_container = $".".get_child(0).get_child(0)
	print("[source]:" ,name)
	print("[source child]:" ,draggable_container.name)
	
	for drag_item in draggable_container.get_children():
			drag_item = (drag_item as Draggable)
			if drag_item.id == dropped_item.id && dropped_item.id!=0:
				draggable_container.remove_child(drag_item)
				drag_item.queue_free()
				break
	
	
