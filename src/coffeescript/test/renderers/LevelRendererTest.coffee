define ['renderers/LevelRenderer'], (LevelRenderer) ->

  describe 'LevelRenderer', ->

    beforeEach ->
      @fakeMovement = {}
      @fakeEventBus =
        on: sinon.stub()