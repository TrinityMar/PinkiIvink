extends CharacterBody2D

const SPEED = 25

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
		if ray_cast_left.is_colliding():
			scale.x = 1
		else:
			scale.x = -1
			
		velocity.x += direction * SPEED * _delta
	move_and_slide()
	
