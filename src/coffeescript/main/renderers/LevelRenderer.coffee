define ['renderers/BlockRenderer', 'renderers/GoalRenderer', 'renderers/PlayerRenderer', 'config'], (BlockRenderer, GoalRenderer, PlayerRenderer, config) ->

  class LevelRenderer

    constructor: (@eventBus, @container, @level) ->
      @_createBlockRenderers()
      @_createGoalRenderers()
      @_createPlayerRenderer()
      @eventBus.on 'player:movement', @_handlePlayerMovement

    _createBlockRenderers: ->
      @blockRenderers = []
      blockGrid = @level.getBlockGrid()
      for col in [0..config.columns-1]
        for row in [0..config.rows-1]
          block = blockGrid.findBlock col, row
          if block
            @_createBlockRenderer block
          else
            console.warn 'No block found at ', [col, row]

    _createBlockRenderer: (block) ->
      renderer = new BlockRenderer @container, block
      @blockRenderers.push renderer

    _createGoalRenderers: ->
      @goalRenderers = []
      for goal in @level.getGoals()
        renderer = new GoalRenderer @container, goal
        @goalRenderers.push renderer

    _createPlayerRenderer: ->
      player = @level.getPlayer()
      @playerRenderer = new PlayerRenderer @eventBus, @container, player

    render: ->
      @_renderBlocks()
      @_renderGoals()
      @_renderPlayer()

    _renderBlocks: ->
      for block in @blockRenderers
        block.render()

    _renderGoals: ->
      for goal in @goalRenderers
        goal.render()

    _renderPlayer: =>
      @playerRenderer.render()

    _handlePlayerMovement: (movement) =>
      movement.done =>
        @_renderPlayer()
        if movement.isBlockPushed()
          @_renderBlocks()
      movement.fail @_renderPlayer