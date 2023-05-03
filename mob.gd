extends CharacterBody3D

var min_speed = 10
var max_speed = 18

signal squashed

func _physics_process(_delta):
	move_and_slide()

	
func initialize(start_position, player_position):
		look_at_from_position(start_position, player_position, Vector3.UP)
		rotate_y(randf_range(-PI/4, PI/4))
		var random_speed = randi_range(min_speed, max_speed)
		velocity = Vector3.FORWARD * random_speed
		velocity = velocity.rotated(Vector3.UP, rotation.y)
		
		$AnimationPlayer.speed_scale = random_speed / min_speed
	


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free() # Replace with function body.

func squash():
	queue_free()
	squashed.emit()
