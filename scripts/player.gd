extends KinematicBody2DWithVelocity


var moveSpeed = 32


func _ready():
    pass


func _physics_process(delta):
    velocity = Vector2.ZERO

    if (Input.is_action_pressed('move_left')):
        velocity.x -= 1
    if (Input.is_action_pressed('move_right')):
        velocity.x += 1
    if (Input.is_action_pressed('move_up')):
        velocity.y -= 1
    if (Input.is_action_pressed('move_down')):
        velocity.y += 1

    # normalize the vector so diagonal movement is not faster
    velocity = velocity.normalized()

    # apply the speed
    velocity *= moveSpeed
