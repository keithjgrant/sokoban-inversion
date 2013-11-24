define ->

  class Map

    constructor: ->
      @blocks = []
      @goals = []

    setPlayer: (@player) ->

    addBlock: (block) ->
      col = block.getColumn()
      row = block.getRow()
      unless @blocks[row]
        @blocks[row] = []
      @blocks[row][col] = block


    addGoal: (goal) ->
      goals.push goal
