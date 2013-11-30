define ['PlayerMovementEvent'], (PlayerMovementEvent) ->

  describe 'PlayerMovementEvent', ->

    beforeEach ->
      @movement = new PlayerMovementEvent [3, 3], [0, -1]

    it 'should return origin coords', ->
      @movement.getOriginCoords().should.eql [3, 3]

    it 'should return destination coords', ->
      @movement.getDestinationCoords().should.eql [3, 2]

    it 'should return next coords', ->
      @movement.getNextCoords().should.eql [3, 1]

    it 'should be in pending state', ->
      @movement.getState().should.equal 'pending'

    describe 'when resolved', ->

      beforeEach ->
        @callback = sinon.spy()
        @failureCallback = sinon.spy()
        @movement.done @callback
        @movement.fail @failureCallback
        @movement.resolve()

      it 'should invoke done callback', ->
        @callback.calledOnce.should.be.true

      it 'should pass reference to self to callback', ->
        @callback.firstCall.args[0].should.equal @movement

      it 'should not invoke failure callback', ->
        @failureCallback.callCount.should.equal 0

    describe 'when rejected', ->

      beforeEach ->
        @callback = sinon.spy()
        @successCallback = sinon.spy()
        @movement.done @successCallback
        @movement.fail @callback
        @movement.reject()

      it 'should invoke fail callback', ->
        @callback.calledOnce.should.be.true

      it 'should pass reference to self to callback', ->
        @callback.firstCall.args[0].should.equal @movement

      it 'should not invoke success callback', ->
        @failureCallback.callCount.should.equal 0
