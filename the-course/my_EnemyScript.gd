extends Node2D

var speed = 50
var tween: Tween
@onready var player = $"."

func _ready() -> void:
	if ! Engine.is_editor_hint():
		scale = Vector2.ZERO
		var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "scale", Vector2.ONE, 1)
		# vary the pitch
		$Synth.pitch_scale = randf_range(0.2, 1.3)
		# wait 2 seconds
		await get_tree().create_timer(2.0).timeout		

	tween = create_tween()
	tween.set_loops(0)
	
	tween.tween_property(self, "position", position + Vector2(175, 0), 1.0)  # Right
	tween.tween_property(self, "position", position + Vector2(-150, 0), 1.0)  # Left
	tween.tween_property(self, "position", position + Vector2(-100, 0), .2) # Sidestep
	tween.tween_property(self, "position", position + Vector2(20, 0), 1.0)  # Left
	tween.tween_property(self, "position", position + Vector2(-170, 0), 1.0)  # Left
	tween.tween_property(self, "position", position + Vector2(100, 0), 1.0)  # Right
	tween.tween_property(self, "position", position + Vector2(90, 0), .2) # Sidestep


func _process(_delta: float) -> void:
	pass


func _draw() -> void:
	# enemy body
	draw_circle(Vector2(0, 0), 20, Color.RED)
	draw_circle(Vector2(0, 0), 10, Color.YELLOW)
	draw_circle(Vector2(0, 0), 3.5, Color.BLACK)
	draw_circle(Vector2(2, -2), 1.5, Color.WHITE)

	var points = [Vector2(10, 20), Vector2(20, 20), Vector2(20, -35)]
	var points2 = [Vector2(-10, 20), Vector2(-20, 20), Vector2(-20, -35)]
	var points3 = [Vector2(20, 20), Vector2(-10, 10), Vector2(-20, 20)]

	draw_polygon(points, [Color.RED])
	draw_polygon(points2, [Color.RED])
	draw_polygon(points3, [Color.RED])
