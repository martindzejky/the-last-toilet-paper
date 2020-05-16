extends KinematicBody2D


var moveSpeed = 32
var velocity = Vector2.ZERO


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
    velocity *= moveSpeed * delta

    # mooooove!
    var collision = move_and_collide(velocity)

    # pushing stuff here
    if collision:
        var remainder = collision.remainder
        var collider = collision.collider

        var dir = Vector2.ZERO
        var dirFromPlayerToObject = collider.global_position - global_position

        # get the remainder vector's angle (in RADIANS!) and use it to set the correct direction
        var angle = dirFromPlayerToObject.angle() + 2*PI

        if angle < PI*5/4:
            dir.x -= 1
        elif angle < PI*7/4:
            dir.y -= 1
        elif angle < PI*9/4:
            dir.x += 1
        elif angle < PI*11/4:
            dir.y += 1
        else:
            dir.x -= 1

        var pushVelocity = dir * remainder.length() / 2

        # only push objects that can be pushed
        # TODO: this feels like not the correct solution
        if collider.canBePushed:
            # try moving the collider in the same direction
            collider.move_and_collide(pushVelocity)
            move_and_collide(pushVelocity)
