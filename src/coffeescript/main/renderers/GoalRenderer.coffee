define ['config'], (config) ->

  class GoalRenderer

    constructor: (@container, @goal) ->

    render: ->
      @_initElement()
      @_update()

    _initElement: ->
      unless @element
        @element = document.createElement 'div'
        @element.className = "goal #{@_getGoalClass()}"
        @_setPosition()
        @container.appendChild @element

    _getGoalClass: ->
      "goal-#{@goal.getColor()}"

    _setPosition: ->
      x = @goal.getColumn() * config.blockSize
      y = @goal.getRow() * config.blockSize
      @element.style.left = "#{x}px"
      @element.style.top = "#{y}px"

    _update: ->
      # TODO: indicate whether goal is satisfied