extends KinematicBody2D

onready var animated = $AnimatedSprite
export var speed = 150
export var gravity = 300
var velocity = Vector2.ZERO
var start_position = Vector2()
var double_jump = false

func _ready():
	start_position = position

func _process(delta):
	# Check if the y-position exceeds 750
	if position.y > 750:
		respawn()

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		double_jump = true

	# Handle horizontal movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		animated.flip_h = false
		if is_on_floor():
			running()
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		animated.flip_h = true
		if is_on_floor():
			running()
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
		if is_on_floor():
			idle()

	# Handle jumping and double jumping
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = -200
			jump()
		elif Input.is_action_pressed("ui_up") and  double_jump:
			velocity.y = -150
			double_jump = false
			jump()
	# Apply movement
	velocity = move_and_slide(velocity, Vector2.UP)

func respawn():
	position = start_position  # Reset position to the starting point
	velocity = Vector2.ZERO    # Reset velocity
	animated.flip_h=false
	# Optionally, reset other properties like health, score, etc.

func idle():
	if animated.animation != "idle":
		animated.play("idle")

func running():
	if animated.animation != "running":
		animated.play("running")

func jump():
	if animated.animation != "jump":
		animated.play("jump")
