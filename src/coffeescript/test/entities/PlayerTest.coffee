define ['entities/Player', 'EventBus'], (Player, EventBus) ->

  describe 'Player', ->

    beforeEach ->
      @eventBus = new EventBus()
      @player = new Player @eventBus, 3, 3

    describe 'when able to move north', ->
      beforeEach ->
        @fakeNeighbor =
          canMoveNorth: sinon.stub().returns true
          pushNorth: sinon.stub()
      it 'should move north', ->
        @player.setNeighbors north: @fakeNeighbor
        @eventBus.trigger 'user:up'

        @fakeNeighbor.pushNorth.calledOnce.should.be.true

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