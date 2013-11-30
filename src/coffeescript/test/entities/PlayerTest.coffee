define ['entities/Player', 'EventBus'], (Player, EventBus) ->

  describe 'Player', ->

    beforeEach ->
      @eventBus = new EventBus()
      @blockGrid = {}
      @player = new Player @eventBus, 3, 3
      @player.setBlockGrid @blockGrid

    describe 'when able to move north', ->
      beforeEach ->
        @blockGrid.canMoveNorth = sinon.stub().returns true
        @blockGrid.moveNorth = sinon.stub()

      it 'should move north', ->
        @eventBus.trigger 'user:up'

        @blockGrid.moveNorth.calledOnce.should.be.true

    describe 'when able to move east', ->
      beforeEach ->
        @fakeNeighbor =
          canMoveEast: sinon.stub().returns true
          pushEast: sinon.stub()
      it 'should move east', ->
        @player.setNeighbors east: @fakeNeighbor
        @eventBus.trigger 'user:right'

        @fakeNeighbor.pushEast.calledOnce.should.be.true


    describe 'when able to push', ->

      it 'should push north', ->

    describe 'when cannot move', ->

      it 'should not move north', ->