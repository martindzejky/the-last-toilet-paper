extends KinematicBody2D
class_name KinematicBody2DWithVelocity

# Implements "velocity", handles movement with collision.
# Also handles pushing things.

export var canBePushed = false
var velocity = Vector2.ZERO


func _physics_process(delta):
    moveAndPush(self, velocity * delta)
    velocity = Vector2.ZERO


func moveAndPush(body, movement):
    if movement.length() < 0.01:
        return

    # mooooove!
    var collision = body.move_and_collide(movement)

    # pushing stuff here
    if collision:
        var remainder = collision.remainder
        var collider = collision.collider

        # exit early if the other object cannot be pushed
        if !('canBePushed' in collider) or !collider.canBePushed:
            return

        var dir = Vector2.ZERO
        var dirFromBodyToCollider = collider.global_position - global_position

        # get the remainder vector's angle (in RADIANS!) and use it to set the correct direction
        var angle = dirFromBodyToCollider.normalized().angle() + 2*PI

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

        var pushVelocity = dir * remainder.length() * 0.6

        # try moving the collider
        moveAndPush(collider, pushVelocity)
        #collider.move_and_collide(pushVelocity)
        body.move_and_collide(remainder)
