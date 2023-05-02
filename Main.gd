extends Node

@export var mob_scene: PackedScene


func _on_mob_timer_timeout():

	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	
	mob_spawn_location.progress_ratio = randf()
	print("mob spawn location: ", mob_spawn_location.position)
	
	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)
	add_child(mob, false, 1)
	print("timeout")
