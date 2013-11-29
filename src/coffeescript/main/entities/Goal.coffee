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

    setBlock: (@block)

    isSatisfied: ->
      @block?.getColor() is @getColor()