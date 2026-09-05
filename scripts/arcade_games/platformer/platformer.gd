extends Node2D


@onready var player = get_tree().get_first_node_in_group("Player")



func _ready() -> void:
	player.can_jump = true
	player.platformer = true
