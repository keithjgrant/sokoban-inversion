define ['config'], (config) ->

  class BlockRenderer

    constructor: (@container, @block) ->

    render: ->
      @_initElement()
      @_updatePosition()

    _initElement: ->
      unless @element
        @element = document.createElement 'div'
        @element.className = "block #{@_getBlockClass()}"
        @container.appendChild @element

    _getBlockClass: ->
      className = "block-#{@block.getColor()}"
      if @block.isPushable() and @block.isKeystone()
        className += '-keystone'
      className

    _updatePosition: ->
      x = @block.getColumn() * config.blockSize
      y = @block.getRow() * config.blockSize
      @element.style.left = "#{x}px"
      @element.style.top = "#{y}px"
