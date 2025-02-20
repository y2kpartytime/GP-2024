class_name Spaceship extends CharacterBody2D

@export var size = 15
@export var line_size = 20
@export var color:Color = Color.GREEN
@onready var radius = size / 1.5 

@export var turn_rate:float=250
@export var speed:float=100

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	radius = size / 2
	queue_redraw()
	_handle_input(delta)

func _handle_input(delta: float) -> void:
	var rotation_direction = 0
	if Input.is_action_pressed("left"):
		rotation_direction -= 1
	if Input.is_action_pressed("right"):
		rotation_direction += 1

	rotation += deg_to_rad(rotation_direction * turn_rate * delta)
	var move_direction = Vector2.ZERO

	if Input.is_action_pressed("forward"):
		move_direction = Vector2(0, -1).rotated(rotation)
	velocity = move_direction * speed
	move_and_slide()
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_pressed("fire"):
		speed = 200
	else:
		speed = 100

func _draw() -> void:
	draw_line(Vector2(-radius, radius), Vector2(0, -radius), color, line_size)
	draw_line(Vector2(radius, radius), Vector2(0, -radius), color, line_size)
	draw_line(Vector2(-radius, radius), Vector2(0, 0), color, line_size)
	draw_line(Vector2(radius, radius), Vector2(0, 0), color, line_size)

	var points = [Vector2(-10, -20), Vector2(10, -20), Vector2(0, 16)]
	draw_polygon(points, [Color(0, 1, 0)])
	var points2 = [Vector2(-10, -20), Vector2(10, -20), Vector2(0, -35)]
	draw_polygon(points2, [Color(0, 1, 0)])
