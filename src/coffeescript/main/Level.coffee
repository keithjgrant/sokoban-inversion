define ['entities/BlockGrid'], (BlockGrid) ->

  class Level

    constructor: (@eventBus) ->
      @blocks = new BlockGrid @eventBus
      @goals = []

    setPlayer: (@player) ->

    getPlayer: ->
      @player

    addBlock: (block) ->
      @blocks.addBlock block

    getBlockGrid: ->
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