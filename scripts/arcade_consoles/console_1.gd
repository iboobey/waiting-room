extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var interacting_label: Label = $InteractingLabel


@onready var interact = get_tree().get_first_node_in_group("InteractionComponent")


func  _ready() -> void:
	interactable.interact = action_on_interact

func action_on_interact():
	get_tree().change_scene_to_file("res://player/player.tscn")

func _process(_delta):
	if interact.current_interactions and interact.can_interact:
		interacting_label.show()
	else:
		interacting_label.hide()
		
