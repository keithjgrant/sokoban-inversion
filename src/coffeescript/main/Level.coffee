define ['entities/BlockGrid'], (BlockGrid) ->

  class Level

    constructor: ->
      @blocks = new BlockGrid()
      @goals = []

    setPlayer: (@player) ->

    getPlayer: ->
      @player

    addBlock: (block) ->
      @blocks.addBlock block

    getBlocks: ->
      @blocks

    addGoal: (goal) ->
      @goals.push goal

    getGoals: ->
      @goals

    isComplete: ->
      for goal, i in @goals
        unless goal.isSatisfied @blocks
          return false
      true