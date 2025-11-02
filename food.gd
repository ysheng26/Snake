class_name Food
extends Node2D

signal consumed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Constructor
func _init():
	var sprite = Sprite2D.new()
	sprite.texture = load("res://assets/bb_32x32.png")
	add_child(sprite)
