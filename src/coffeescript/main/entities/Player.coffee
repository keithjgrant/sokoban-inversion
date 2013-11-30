define ['PlayerMovementEvent'], (PlayerMovementEvent) ->

  class Player

    constructor: (@eventBus, @col, @row) ->
      @isMoving = false
      @eventBus.on 'user:up', @_moveNorth
      @eventBus.on 'user:right', @_moveEast
      @eventBus.on 'user:down', @_moveSouth
      @eventBus.on 'user:left', @_moveWest

    getCoords: ->
      [@col, @row]

    getColumn: ->
      @col

    getRow: ->
      @row

    _moveNorth: =>
      @_move 0, -1

    _moveEast: =>
      @_move 1, 0

    _moveSouth: =>
      @_move 0, 1

    _moveWest: =>
      @_move -1, 0

    _move: (dx, dy) ->
      @col += dx
      @row += dy
      @isMoving = true
      movement = new PlayerMovementEvent @getCoords, [dx, dy]
      movement.then @_handleMovementDone, @_handleMovementFailure
      @eventBus.trigger 'player:movement', movement

    _handleMovementFailure: (movement) =>
      [@col, @row] = movement.getOriginCoords()
      @isMoving = false

    _handleMovementDone: (movement) =>
      @isMoving = false
