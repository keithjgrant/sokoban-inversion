define ['PlayerMovementEvent'], (PlayerMovementEvent) ->

  class Player

    constructor: (@eventBus, @col, @row) ->
      @isMoving = false
      # TODO listen to keydown+keyup, allow user to hold key
      @eventBus.on 'user:keydown:up', @_moveNorth
      @eventBus.on 'user:keydown:right', @_moveEast
      @eventBus.on 'user:keydown:down', @_moveSouth
      @eventBus.on 'user:keydown:left', @_moveWest

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
      @isMoving = true
      movement = new PlayerMovementEvent @getCoords(), [dx, dy]
      movement.then @_handleMovementDone, @_handleMovementFailure
      @col += dx
      @row += dy
      @eventBus.trigger 'player:movement', movement

    _handleMovementFailure: (movement) =>
      [@col, @row] = movement.getOriginCoords()
      @isMoving = false

    _handleMovementDone: (movement) =>
      @isMoving = false
