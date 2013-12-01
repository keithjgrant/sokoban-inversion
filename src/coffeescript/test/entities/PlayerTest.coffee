define ['entities/Player', 'EventBus'], (Player, EventBus) ->

  describe 'Player', ->

    it 'TODO: UPDATE PLAYER TESTS FOR PlayerMovementEvent', ->
      true.should.be.false
    # TODO: tests fail - waiting to make sure I like the new
    # PlayerMovementEvent approach before fixing
    # beforeEach ->
    #   @eventBus = new EventBus()
    #   @player = new Player @eventBus, 3, 3

    # describe 'when able to move north', ->
    #   beforeEach ->
    #     @blockGrid.canMoveNorth = sinon.stub().returns true
    #     @blockGrid.moveNorth = sinon.stub()

    #   it 'should move north', ->
    #     @eventBus.trigger 'user:up'

    #     @blockGrid.moveNorth.calledOnce.should.be.true

    # describe 'when able to move east', ->
    #   beforeEach ->
    #     @fakeNeighbor =
    #       canMoveEast: sinon.stub().returns true
    #       pushEast: sinon.stub()
    #   it 'should move east', ->
    #     @player.setNeighbors east: @fakeNeighbor
    #     @eventBus.trigger 'user:right'

    #     @fakeNeighbor.pushEast.calledOnce.should.be.true


    # describe 'when able to push', ->

    #   it 'should push north', ->

    # describe 'when cannot move', ->

    #   it 'should not move north', ->