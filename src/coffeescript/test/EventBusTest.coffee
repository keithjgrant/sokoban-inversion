define ['EventBus'], (EventBus) ->

  describe 'EventBus', ->

    beforeEach ->
      @eventBus = new EventBus()

    describe 'when callback registered', ->

      beforeEach ->
        @callback = sinon.spy()
        @eventBus.on 'foo:event', @callback
  
      it 'should invoke callback on trigger', ->
        @callback.callCount.should.equal 0

        @eventBus.trigger 'foo:event'

        @callback.calledOnce.should.be.true

      it 'should pass payload to callback', ->
        @eventBus.trigger 'foo:event', 'payload'

        @callback.calledOnce.should.be.true
        @callback.firstCall.args[0].should.equal 'payload'

    describe 'when multiple callbacks registered', ->

      beforeEach ->
        @callbackOne = sinon.spy()
        @callbackTwo = sinon.spy()
        @eventBus.on 'foo:event', @callbackOne
        @eventBus.on 'foo:event', @callbackTwo

      it 'should invoke multiple callbacks', ->
        @eventBus.trigger 'foo:event'

        @callbackOne.calledOnce.should.be.true
        @callbackTwo.calledOnce.should.be.true