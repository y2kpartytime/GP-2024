extends Node2D

var tween: Tween
var timer: Timer

func _ready():
	if ! Engine.is_editor_hint():
		scale = Vector2.ZERO
		var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "scale", Vector2.ONE, 1)
		# vary the pitch
		$Synth.pitch_scale = randf_range(0.7, 1.3)
		# wait 2 seconds
		await get_tree().create_timer(2.0).timeout
	
	
	tween = create_tween()
	tween.set_loops(0)

	tween.tween_property(self, "position", position + Vector2(100, 0), 1.0)  # Right
	tween.tween_property(self, "position", position + Vector2(-100, 0), 1.0)  # Left
	tween.chain()




func _process(_delta: float) -> void:
	pass

func _draw() -> void:
	# enemy body
	draw_circle(Vector2(0, 0), 20, Color.MEDIUM_PURPLE)
	draw_circle(Vector2(0, 15), 20.5, Color.MEDIUM_PURPLE)
	draw_circle(Vector2(0, 0), 10, Color.YELLOW)
	draw_circle(Vector2(0, 0), 3.5, Color.BLACK)
	draw_circle(Vector2(2, -2), 1.5, Color.LIGHT_CORAL)

	# other enemy parts
	var points = [Vector2(10, 20), Vector2(20, 20), Vector2(20, -35)]
	var points2 = [Vector2(-10, 20), Vector2(-20, 20), Vector2(-20, -35)]
	var points3 = [Vector2(20, 20), Vector2(-10, 10), Vector2(-20, 20)]

	draw_polygon(points, [Color.MEDIUM_PURPLE])
	draw_polygon(points2, [Color.MEDIUM_PURPLE])
	draw_polygon(points3, [Color.MEDIUM_PURPLE])
