define ['LevelParser', 'renderers/LevelRenderer', 'levels'], (LevelParser, LevelRenderer, levels) ->

  class LevelScene

    constructor: (@levelNum) ->
      @_init()

    _init: ->
      @_generateLevel()
      @_renderer = new LevelRenderer @level

    _generateLevel: ->
      levelData = levels[@levelNum]
      parser = new LevelParser()
      @level = parser.parse levelData
