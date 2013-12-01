define ['config'], (config) ->

  class PlayerRenderer

    constructor: (@container, @player) ->

    render: ->
      @_initElement()
      @_updatePosition()

    _initElement: ->
      unless @element
        @element = document.createElement 'div'
        @element.className = "player"
        @container.appendChild @element

    _updatePosition: ->
      x = @player.getColumn() * config.blockSize
      y = @player.getRow() * config.blockSize
      @element.style.left = "#{x}px"
      @element.style.top = "#{y}px"
