define -> #['PlayerMovementEvent'], (PlayerMovementEvent) ->

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

    setBlockGrid: (@blockGrid) ->

    _attemptMoveNorth: =>
      if @blockGrid.canMoveNorth()
        @_moveNorth()

    _moveNorth: ->
      @north.pushNorth()
      @_move 0, -1

    _attemptMoveEast: =>
      if @blockGrid.canMoveEast()
        @_moveEast()

    _moveEast: ->
      @east.pushEast()
      @_move 1, 0

    _attemptMoveSouth: =>
      if @blockGrid.canMoveSouth()
        @_moveSouth()

    _moveSouth: ->
      @south.pushSouth()
      @_move 0, 1

    _attemptMoveWest: =>
      if @blockGrid.canMoveWest()
        @_moveWest()

    _moveWest: ->
      @west.pushWest()
      @_move -1, 0

    _move: (dx, dy) ->
      @col += dx
      @row += dy
