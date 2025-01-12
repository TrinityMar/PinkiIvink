extends CharacterBody2D

const SPEED = 16

@onready var ray_cast_left: RayCast2D = $RayCast2DLeft
@onready var ray_cast_right: RayCast2D = $RayCast2DRight

var direction = 1

func _ready() -> void:
	add_to_group("Enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	move(_delta)


func move(_delta):
	if is_on_floor():
		if ray_cast_right.is_colliding():
			direction = -1
		elif ray_cast_left.is_colliding():
			direction = 1
		velocity.x += direction * SPEED * _delta
	elif not is_on_floor():
		velocity += get_gravity() * _delta
		
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	move_and_slide()
	
