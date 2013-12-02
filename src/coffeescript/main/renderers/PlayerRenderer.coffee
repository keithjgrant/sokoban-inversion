define ['renderers/transitionEnd', 'config'], (transitionEnd, config) ->

  class PlayerRenderer

    constructor: (@eventBus, @container, @player) ->

    render: ->
      @_initElement()
      @_updatePosition()

    _initElement: ->
      unless @element
        @element = document.createElement 'div'
        @element.className = "player"
        @container.appendChild @element
        @_listenForTransitionEnd()

    _updatePosition: ->
      x = @player.getColumn() * config.blockSize
      y = @player.getRow() * config.blockSize
      @element.style.left = "#{x}px"
      @element.style.top = "#{y}px"

    _listenForTransitionEnd: ->
      if transitionEnd
        @element.addEventListener transitionEnd, =>
          @eventBus.trigger 'player:movement:complete'
      else
        alert 'Your browser is not supported'