extends Node2D
@onready var snake: Snake = $Snake

var FoodScene = preload("res://Food.tscn")

# 1024 x 768
# maybe get a background later
# 32 rows 24 cols

# 30 rows 22 cols
# 16 margin all sides

# game spawns the snake and keeps spawning food
# logic to update the snake and food should be here

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake.connect("died", on_snake_died)
	snake.position = Vector2(randi_range(1, 31) * 32, randi_range(1, 23) * 32)
	spawn_food()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.score = len(snake.snake_body_list)


func spawn_food():
	var pos = Vector2(randi_range(1, 31) * 32, randi_range(1, 23) * 32)
	var food = FoodScene.instantiate()
	food.position = pos
	food.connect("consumed", spawn_food)
	call_deferred("add_child", food)


func on_snake_died():
	get_tree().change_scene_to_file("res://GameOver.tscn")
