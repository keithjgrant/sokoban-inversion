define ['entities/Wall', 'entities/PushableBlock', 'entities/Gateway'], (Wall, PushableBlock, Gateway) ->

  class BlockFactory

    constructor: ->
      @blockByChar =
        w: @_createWall
        a: @_createPushableWhite
        A: @_createPushableWhiteKeystone
        b: @_createPushableBlue
        B: @_createPushableBlueKeystone
        c: @_createPushableRed
        C: @_createPushableRedKeystone
        g: @_createGateway

    createBlock: (char, col, row) ->
      func = @blockByChar[char]
      func col, row

    _createWall: (col, row) =>
      new Wall col, row

    _createPushableWhite: (col, row) =>
      block = new PushableBlock col, row
      block.setColor 'white'
      block

    _createPushableWhiteKeystone: (col, row) =>
      block = @_createPushableWhite col, row
      block.setKeystone()
      block

    _createPushableBlue: (col, row) =>
      block = new PushableBlock col, row
      block.setColor 'blue'
      block

    _createPushableBlueKeystone: (col, row) =>
      block = @_createPushableBlue col, row
      block.setKeystone()
      block

    _createPushableRed: (col, row) =>
      block = new PushableBlock col, row
      block.setColor 'red'
      block

    _createPushableRedKeystone: (col, row) =>
      block = @_createPushableRed col, row
      block.setKeystone()
      block

    _createGateway: (col, row) =>
      new Gateway col, row