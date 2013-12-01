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

    # REFACTOR - BlockPushEvent?
    _handlePlayerMovement: (movement) =>
      if @_playerCanStep movement
        movement.resolveStep()
      else if @_attemptPush movement
        movement.resolvePush()
      else
        movement.reject()

    _playerCanStep: (movement) ->
      playerBlock = @findBlock movement.getOriginCoords()
      destinationBlock = @findBlock movement.getDestinationCoords()

      console.debug 'STEP', playerBlock.getColor(), destinationBlock.getColor()
      playerBlock.getColor() is destinationBlock?.getColor()

    _attemptPush: (movement) ->
      playerBlock = @findBlock movement.getOriginCoords()
      block = @findBlock movement.getDestinationCoords()
      targetBlock = @findBlock movement.getNextCoords()

      if @_canPush playerBlock, block, targetBlock
        blockCoords = block.getCoords()
        block.moveTo targetBlock.getCoords()
        targetBlock.pushOverTo blockCoords
        @_updateBlockPosition block
        @_updateBlockPosition targetBlock
        true
      else
        false

    _canPush: (playerBlock, block, targetBlock) ->
      unless block.isPushable()
        return false
      currentColor = playerBlock.getColor()
      blockColor = block?.getColor()
      targetColor = targetBlock?.getColor()

      console.debug 'PUSH', currentColor, blockColor, targetColor

      currentColor isnt blockColor and currentColor is targetColor

    _updateBlockPosition: (block) ->
      col = block.getColumn()
      row = block.getRow()
      @blocks[row][col] = block