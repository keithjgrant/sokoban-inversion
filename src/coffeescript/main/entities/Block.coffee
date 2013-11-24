define ->

  class Block

    constructor: (@col, @row) ->

    setNeighbors: (neighbors) ->
      @north = neighbors.north
      @east = neighbors.east
      @south = neighbors.south
      @west = neighbors.west

