define ->

  class Level

    constructor: ->
      @blocks = []
      @goals = []

    setPlayer: (@player) ->

    getPlayer: ->
      @player

    addBlock: (block) ->
      @blocks.push block

    getBlocks: ->
      @blocks

    addGoal: (goal) ->
      @goals.push goal

    getGoals: ->
      @goals