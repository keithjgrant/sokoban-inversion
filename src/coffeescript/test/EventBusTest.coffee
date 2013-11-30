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

      it 'should not trigger callback if different event triggered', ->
        @eventBus.trigger 'foo:otherEvent'

        @callback.callCount.should.equal 0

      it 'should stop triggering after off() called', ->
        @eventBus.off 'foo:event', @callback
        @eventBus.trigger 'foo:event'

        @callback.callCount.should.equal 0

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

    describe 'when callback registered with one()', ->

      beforeEach ->
        @callback = sinon.spy()
        @eventBus.one 'foo:event', @callback

      it 'should invoke callback only once', ->
        @eventBus.trigger 'foo:event'
        @eventBus.trigger 'foo:event'

        @callback.calledOnce.should.be.true