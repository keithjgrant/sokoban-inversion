define ->

  class Block

    constructor: (@col, @row) ->

    getCoords: ->
      [@col, @row]

    getColumn: ->
      @col

    getRow: ->
      @row
