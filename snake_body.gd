class_name SnakeBody
extends Node2D

signal ate_food
signal died

const sprite_resources = [
	"res://assets/aa_32x32.png",
	"res://assets/cf_32x32.png",
	"res://assets/er_32x32.png",
	"res://assets/jg_32x32.png",
	"res://assets/kl_32x32.png",
	"res://assets/mz_32x32.png",
	"res://assets/tn_32x32.png",
	"res://assets/ys_32x32.png",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Constructor
func _init():
	var tmp = sprite_resources.pick_random()
	var sprite = Sprite2D.new()
	sprite.texture = load(tmp)
	add_child(sprite)


func _on_snake_body_area_entered(area: Area2D) -> void:
	var node = area.get_parent()
	if node is SnakeBody or node.name == "Walls":
		emit_signal("died")
	elif node is Food:
		emit_signal("ate_food")
		node.emit_signal("consumed")
		node.queue_free()
