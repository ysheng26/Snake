"""
Should I just manage the Sprites and positions here?

Or should I make a new "snake body" node
Where snake is constructed with multiple snake bodies

Let's start small, go with the first approach

Let's see how can I dynamically render the Sprite2D
"""
class_name Snake
extends Node2D

signal died

const UP = Vector2(0, -1)
const RIGHT = Vector2(1, 0)
const LEFT = Vector2(-1, 0)
const DOWN = Vector2(0, 1)

var direction_list = [UP, RIGHT, LEFT, DOWN]
var direction = direction_list.pick_random();

# index 0 is head
var snake_body_list = []

var SnakeBodyScene = preload("res://SnakeBody.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var snake_head = SnakeBodyScene.instantiate()
	add_child(snake_head)
	snake_body_list.append(snake_head)
	snake_head.connect("ate_food", on_snake_ate_food)
	snake_head.connect("died", on_snake_died)


var move_timer = 0
var move_delay = 0.2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_input()
	move_timer += delta
	if move_timer >= move_delay:
		move_timer = 0
		move_snake(direction)


func move_snake(dir: Vector2):
	# debug_print_all_pos()
	# update positions of all parts
	var prev = snake_body_list[0].position
	snake_body_list[0].position = snake_body_list[0].position + dir * 32
	for i in range(1, len(snake_body_list)):
		var curr = snake_body_list[i].position
		snake_body_list[i].position = prev
		prev = curr


func on_snake_ate_food():
	# add new node to tail
	var snake_body = SnakeBodyScene.instantiate()
	snake_body.position = snake_body_list[-1].position - direction * 32
	snake_body_list.append(snake_body)
	call_deferred("add_child", snake_body)
	move_delay = max(0.05, move_delay-0.05)

func on_snake_died():
	emit_signal("died")


func handle_input():
	if Input.is_action_pressed("up") and direction != DOWN:
		direction = UP
	elif Input.is_action_pressed("down") and direction != UP:
		direction = DOWN
	elif Input.is_action_pressed("left") and direction != RIGHT:
		direction = LEFT
	elif Input.is_action_pressed("right") and direction != LEFT:
		direction = RIGHT
