"""
Should I just manage the Sprites and positions here?

Or should I make a new "snake body" node
Where snake is constructed with multiple snake bodies

Let's start small, go with the first approach

Let's see how can I dynamically render the Sprite2D
"""


extends Node2D

var length:int = 1

const UP = Vector2(0, -1)
const RIGHT = Vector2(1, 0)
const LEFT = Vector2(-1, 0)
const DOWN = Vector2(0, 1)

var direction_list = [UP, RIGHT, LEFT, DOWN]
var direction = direction_list.pick_random();

# var positions = []
var head = null;

var speed = 10;

var SnakeBodyScene = preload("res://SnakeBody.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	head = add_new_snake_body();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_new_snake_body():
	var snake_body = SnakeBodyScene.instantiate()
	add_child(snake_body)
