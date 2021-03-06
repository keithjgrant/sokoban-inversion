define ['parser/LevelParser', 'renderers/LevelRenderer', 'levels'], (LevelParser, LevelRenderer, levels) ->

  class LevelScene

    constructor: (@eventBus, @container, @levelNum) ->
      @_generateLevel()
      @renderer = new LevelRenderer @eventBus, @container, @level
      @renderer.render()
      @eventBus.on 'player:movement:complete', @_checkForLevelCompletion

    _generateLevel: ->
      levelData = levels[@levelNum]
      parser = new LevelParser @eventBus
      @level = parser.parse levelData

    _checkForLevelCompletion: =>
      if @level.isComplete()
        @eventBus.trigger 'level:complete'
        @renderer.renderCompleteDialog()
