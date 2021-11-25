extends Node2D

const FCS: PackedScene = preload("res://characters/Enemy/FlyingCreature/FlyingCreature.tscn")
var timer: Timer

func _spawn_flyey():
	var flyey: KinematicBody2D = FCS.instance()
	print("Fly for me")
	# don't need this? projectile.launch(global_position, (player.position - global_position).normalized(), projectile_speed)
	flyey.global_position = self.global_position
	get_tree().current_scene.add_child(flyey)


func _on_Timer_timeout():
	_spawn_flyey()
