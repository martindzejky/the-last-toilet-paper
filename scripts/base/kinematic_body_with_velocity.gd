extends KinematicBody2D
class_name KinematicBody2DWithVelocity

# Implements "velocity", handles movement with collision.
# Also handles pushing things.

export var canBePushed = false
var velocity = Vector2.ZERO


func _physics_process(delta):
    # mooooove!
    var collision = move_and_collide(velocity * delta)

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

        var pushVelocity = dir * remainder.length() / delta

        # only push objects that can be pushed
        if 'canBePushed' in collider and collider.canBePushed:
            # transfer velocity
            collider.velocity = pushVelocity * .7

    # finally, stop moving
    velocity = Vector2.ZERO
