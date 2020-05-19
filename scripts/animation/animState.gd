extends Node2D
class_name AnimState

# possible animation states, can be combined
enum States {
    LEFT = 1 << 0
    UP = 1 << 1
    RIGHT = 1 << 2
    DOWN = 1 << 3

    MOVE = 1 << 4
    PUSH = 1 << 5
    SEARCH = 1 << 6
}


# current state
# use bitwise operations to set multiple states
var state = 0
