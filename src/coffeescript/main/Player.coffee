define ->

  class Player

    constructor: (@eventBus, @col, @row) ->
      @eventBus.on 'user:up', @_attemptMoveNorth
      @eventBus.on 'user:right', @_attemptMoveEast
      @eventBus.on 'user:down', @_attemptMoveSouth
      @eventBus.on 'user:left', @_attemptMoveWest

    setNeighbors: (neighbors)
      @north = neighbors.north
      @east = neighbors.east
      @south = neighbors.south
      @west = neighbors.west

    _attemptMoveNorth: =>
      if @neighbors.north.canPushNorth()
        _moveNorth()

    _moveNorth: ->
      @neighbors.north.pushNorth()
      @_move 0, -1

    _attemptMoveEast: =>
      if @neighbors.east.canPushEast()
        _moveEast()

    _moveEast: ->
      @neighbors.east.pushEast()
      @_move 1, 0

    _attemptMoveSouth: =>
      if @neighbors.south.canPushSouth()
        _moveSouth()

    _moveSouth: ->
      @neighbors.south.pushSouth()
      @_move 0, 1

    _attemptMoveWest: =>
      if @neighbors.west.canPushWest()
        _moveWest()

    _moveWest: ->
      @neighbors.west.pushWest()
      @_move -1, 0

    _move: (dx, dy) ->
      @col += dx
      @row += dy
