define ->

  class BlockGrid

    constructor: (@eventBus) ->
      @blocks = []
      @eventBus.on 'player:movement', @_handlePlayerMovement

    addBlock: (block) ->
      col = block.getColumn()
      row = block.getRow()
      unless @blocks[row]
        @blocks[row] = []
      @blocks[row][col] = block

    findBlock: (col, row) ->
      if col instanceof Array
        [col, row] = col
      @blocks[row]?[col] or null

    _handlePlayerMovement: (movement) ->
      if @_playerCanStep movement
        movement.resolve()
      else if @_playerCanPushBlock movement
        movement.resolve()
      else
        movement.reject()

    _playerCanStep: (movement) ->
      playerBlock = @findBlock movement.getOriginCoords()
      destinationBlock = @findBlock movement.getDestinationCoords()
      playerBlock.getColor() is destinationBlock?.getColor()

    _playerCanPushBlock: (movement) ->
      playerBlock = @findBlock movement.getOriginCoords()
      block = @findBlock movement.getDestinationCoords()
      targetBlock = @findBlock movement.getNextCoords()

      currentColor = playerBlock.getColor()
      blockColor = block?.getColor()
      targetColor = targetBlock?.getColor()

      currentColor isnt blockColor and currentColor is targetColor
