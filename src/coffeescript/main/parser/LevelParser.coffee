define ['Level', 'parser/BlockFactory', 'parser/GoalFactory', 'entities/Player], (Level, BlockFactory, GoalFactory, Player) ->
  
  class LevelParser

    constructor: (@eventBus) ->
      @blockFactory = new BlockFactory()
      @goalFactory = new GoalFactory()

    parse: (@data) ->
      @level = new Level()
      @_parseBlocks()
      @_parseGoals()
      @_parsePlayer()
      @level

    _parseBlocks: ->
      for row in @data.blocks
        for col in [0..row.length]
          char = row[col]
          block = @blockFactory.createBlock char, col, row
          @level.addBlock block

    _parseGoals: ->
      for def in @data.goals
        col = def[0]
        row = def[1]
        char = def[2]
        goal = @goalFactory.createGoal char, col, row
        @level.addGoal goal

    _parsePlayer: ->
      col = @data.player[0]
      row = @data.player[1]
      player = new Player @eventBus, col, row
      @level.setPlayer player

