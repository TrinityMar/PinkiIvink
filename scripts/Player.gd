extends CharacterBody2D

const SPEED = 120
const JUMP = 390 #было 350

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	move(_delta)
	animation()

func move(_delta):
	#Гравитация
	if not is_on_floor():
		velocity += get_gravity() * _delta
	
	#Движения
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("Right") and not Input.is_action_pressed("Left"):
		velocity.x = SPEED
	else:
		velocity.x = 0 
		
	#Прыжок
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = -JUMP

		
	move_and_slide()
	
func animation():
	if velocity.y != 0 or is_on_ceiling():
		$AnimatedSprite2D.play("Jump")
		$AnimatedSprite2D.scale.x = -1 if velocity.x < 0 else 1
	elif velocity.x != 0:
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.scale.x = 1 if velocity.x > 0 else - 1
	else: 
		$AnimatedSprite2D.play("Idle")
