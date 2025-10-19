extends Node2D
@onready var snake: Node2D = $Snake

# 1024 x 768
# maybe get a background later

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake.position = Vector2(500, 500)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
