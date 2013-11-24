define ['UserInput', 'config'], (UserInput, config) ->

  describe 'UserInput', ->

    beforeEach ->
      @triggerSpy = sinon.spy()
      @fakeEventBus =
        trigger: @triggerSpy
      @userInput = new UserInput @fakeEventBus

    describe 'when key pressed', ->

      beforeEach ->
        event = new Event 'keydown'
        event.keycode = config.controls.up[0]
        document.dispatchEvent event

      it 'should trigger user:keydown:up', ->
        @triggerSpy.calledOnce.should.be.true
        eventName = 'user:keydown:up'
        @triggerSpy.firstCall.args[0].should.equal eventName

    describe 'when key released', ->

      beforeEach ->
        event = new Event 'keyup'
        event.keycode = config.controls.up[0]
        document.dispatchEvent event

      it 'should trigger user:keyup:up', ->
        @triggerSpy.calledOnce.should.be.true
        eventName = 'user:keyup:up'
        @triggerSpy.firstCall.args[0].should.equal eventName
