define ['LevelParser', 'renderers/LevelRenderer', 'levels'], (LevelParser, LevelRenderer, levels) ->

  class LevelScene

    constructor: (@levelNum) ->
      @_generateLevel()
      @renderer = new LevelRenderer @level

    _generateLevel: ->
      levelData = levels[@levelNum]
      parser = new LevelParser @eventBus
      @level = parser.parse levelData
