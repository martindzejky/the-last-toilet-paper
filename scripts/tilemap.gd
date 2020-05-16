extends TileMap

export(Resource) var regalObject
export(Resource) var regalLeftObject
export(Resource) var regalRightObject

func _ready():
    # some tiles need to be converted by instancing objects
    # in their place

    var cells = get_used_cells()
    for cellCoord in cells:
        var cell = get_cell(cellCoord.x, cellCoord.y)

        if cell == INVALID_CELL:
            continue

        var cellName = tile_set.tile_get_name(cell)

        match cellName:
            'regal bottom':
                replaceTileWithObject(cellCoord, regalObject)
            'regal left':
                replaceTileWithObject(cellCoord, regalLeftObject)
            'regal right':
                replaceTileWithObject(cellCoord, regalRightObject)


func replaceTileWithObject(coords: Vector2, object: Resource):
    var floorTile = tile_set.find_tile_by_name('floor')

    if floorTile == INVALID_CELL:
        push_warning('tile named "floor" not found!')
        return

    set_cell(coords.x, coords.y, floorTile)

    var newObject = object.instance()
    newObject.position = map_to_world(coords) + Vector2(8, 8)

    # this will stop working if the tilemap does not have a parent, right now it does...
    get_parent().call_deferred('add_child', newObject)
