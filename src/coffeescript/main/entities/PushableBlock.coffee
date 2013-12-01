define ['entities/Block'], (Block)->

  class PushableBlock extends Block

    setKeystone: (@_isKeystone=true) ->

    isKeystone: ->
      @_isKeystone or false

    setColor: (@color) ->

    getColor: ->
      @color

    isPushable: ->
      true

    canPushNorth: ->
      @_canPush @south, @north

    canPushSouth: ->
      @_canPush @south, @north

    canPushEast: ->
      @_canPush @west, @east

    canPushWest: ->
      @_canPush @east, @west

    _canPush: (fromBlock, toBlock) ->
      if @getColor() is toBlock.getColor()
        false
      else if fromBlock.getColor() isnt toBlock.getColor()
        false
      else
        true

    moveTo: (coords) ->
      [@col, @row] = coords

    pushOverTo: (coords) ->
      # TODO: fix for animation
      @moveTo coords