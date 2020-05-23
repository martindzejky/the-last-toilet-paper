extends Node2D

# Handles input for the player. Requires a sibling called
# "physics" to control the character and "animState" to
# control the animations.


var body: Node2D
var physics: CharacterPhysics
var animState: AnimState

export(float) var movePerSecond = 64


func _ready():
    body = get_parent()
    physics = body.get_node('physics')
    animState = body.get_node('animState')

    assert(physics is CharacterPhysics)
    assert(animState is AnimState)

func _process(_delta):
    # reset the directional animation states
    # 15 combines all directional bits
    animState.state &= ~15

    var velocity = Vector2.ZERO

    if (Input.is_action_pressed('move_left')):
        velocity.x -= 1
        animState.state |= AnimState.States.LEFT
    if (Input.is_action_pressed('move_right')):
        velocity.x += 1
        animState.state |= AnimState.States.RIGHT
    if (Input.is_action_pressed('move_up')):
        velocity.y -= 1
        animState.state |= AnimState.States.UP
    if (Input.is_action_pressed('move_down')):
        velocity.y += 1
        animState.state |= AnimState.States.DOWN

    # normalize the vector so diagonal movement is not faster
    velocity = velocity.normalized()

    # apply the speed
    velocity *= movePerSecond

    physics.velocity = velocity
