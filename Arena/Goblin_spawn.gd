extends Node2D

const GOBLIN: PackedScene = preload("res://characters/Enemy/Goblin/Goblin.tscn")
var timer: Timer

func _spawn_gobby():
	var gobby: KinematicBody2D = GOBLIN.instance()
	print("goblin spawn!")
	# don't need this? projectile.launch(global_position, (player.position - global_position).normalized(), projectile_speed)
	gobby.global_position = self.global_position
	get_tree().current_scene.add_child(gobby)


func _on_Timer_timeout():
	_spawn_gobby()
