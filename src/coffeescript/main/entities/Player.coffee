define ->

  class Player

    constructor: (@eventBus, @col, @row) ->
      @eventBus.on 'user:up', @_attemptMoveNorth
      @eventBus.on 'user:right', @_attemptMoveEast
      @eventBus.on 'user:down', @_attemptMoveSouth
      @eventBus.on 'user:left', @_attemptMoveWest

    getCoords: ->
      [@col, @row]

    getColumn: ->
      @col

    getRow: ->
      @row

    setNeighbors: (neighbors) ->
      @north = neighbors.north
      @east = neighbors.east
      @south = neighbors.south
      @west = neighbors.west

    _attemptMoveNorth: =>
      if @north.canMoveNorth()
        @_moveNorth()

    _moveNorth: ->
      @north.pushNorth()
      @_move 0, -1

    _attemptMoveEast: =>
      if @east.canMoveEast()
        @_moveEast()

    _moveEast: ->
      @east.pushEast()
      @_move 1, 0

    _attemptMoveSouth: =>
      if @south.canMoveSouth()
        @_moveSouth()

    _moveSouth: ->
      @south.pushSouth()
      @_move 0, 1

    _attemptMoveWest: =>
      if @west.canMoveWest()
        @_moveWest()

    _moveWest: ->
      @west.pushWest()
      @_move -1, 0

    _move: (dx, dy) ->
      @col += dx
      @row += dy
