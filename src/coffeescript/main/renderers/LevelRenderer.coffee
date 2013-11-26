define ->

  class LevelRenderer

    constructor: (@level) ->
      @_createBlockRenderers()
      @_createGoalRenderers()
      @_createPlayerRenderer()

    _createBlockRenderers: ->
      @blockRenderers = []
      for block in @level.getBlocks()
        rendered = new BlockRenderer block
        @blockRenderers.push renderer