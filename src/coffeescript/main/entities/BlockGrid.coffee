define ->

  class BlockGrid

    constructor: ->
      @blocks = []

    addBlock: (block) ->
      col = block.getColumn()
      row = block.getRow()
      unless @blocks[row]
        @blocks[row] = []
      @blocks[row][col] = block

    findBlock: (col, row) ->
      @blocks[row]?[col] or null