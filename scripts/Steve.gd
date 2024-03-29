extends KinematicBody

var velocity = Vector3(0, 0, 0)
const SPEED = 6
const ROTATION_SPEED = 5.5

func _ready():
	pass

func _physics_process(delta):
	
	velocity = moveX(velocity);
	velocity = moveZ(velocity);
	
	move_and_slide(velocity)
	
	
func moveX(velocity : Vector3) -> Vector3:
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROTATION_SPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROTATION_SPEED))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
		
	return velocity
	
func moveZ(velocity : Vector3) -> Vector3:
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROTATION_SPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROTATION_SPEED))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		
	return velocity