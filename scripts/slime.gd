extends CharacterBody2D

const SPEED = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	move(_delta)
	takc()

func takc():
	if $RayCast2DLeft.is_colliding():
		print("sosal")
	elif $RayCast2DRight.is_colliding():
		print("sosal")

func move(_delta):
	
	if is_on_floor():
		velocity.x = SPEED
		print("gg")
	
	move_and_slide()
