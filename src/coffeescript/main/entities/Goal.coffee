define ->

  class Goal

    constructor: (@col, @row) ->

    getCoords: ->
      [@col, @row]

    getColumn: ->
      @col

    getRow: ->
      @row

    setColor: (@color) ->

    getColor: ->
      @color

    isSatisfied: (blockGrid) ->
      block = blockGrid.findBlock @col, @row
      if block
        block.isKeystone() and block.getColor() is @getColor()
      else
        false