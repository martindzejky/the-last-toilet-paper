extends KinematicBody2D


var moveSpeed = 32
var currentVelocity = Vector2.ZERO


func _ready():
    pass


func _physics_process(delta):
    currentVelocity = Vector2.ZERO

    if (Input.is_action_pressed('move_left')):
        currentVelocity.x -= 1
    if (Input.is_action_pressed('move_right')):
        currentVelocity.x += 1
    if (Input.is_action_pressed('move_up')):
        currentVelocity.y -= 1
    if (Input.is_action_pressed('move_down')):
        currentVelocity.y += 1

    # normalize the vector so diagonal movement is not faster
    currentVelocity = currentVelocity.normalized()

    # apply the speed
    currentVelocity *= moveSpeed * delta

    # mooooove!
    currentVelocity = move_and_collide(currentVelocity)
