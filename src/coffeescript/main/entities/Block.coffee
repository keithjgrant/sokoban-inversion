define ->

  class Block

    constructor: (@col, @row) ->

    getCoords: ->
      [@col, @row]

    getColumn: ->
      @col

    getRow: ->
      @row

    setNeighbors: (neighbors) ->
      @north = neighbors.north
      @east = neighbors.east
      @south = neighbors.south
      @west = neighbors.west

