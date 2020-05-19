extends Node2D
class_name CharacterPhysics

# This node implements physics for characters. It should
# be placed as a child of the kinematic body of the character.


var body: KinematicBody2D
var velocity = Vector2.ZERO


func _ready():
    body = get_parent()
    assert(body is KinematicBody2D)


func _physics_process(delta):
    if velocity.length() < 0.001:
        return

    # move the parent body
    body.move_and_collide(velocity * delta)

    # reset the velocity
    velocity = Vector2.ZERO
