define ['EventBus'], (EventBus) ->

  describe 'EventBus', ->
  
    it 'should trigger registered callbacks', ->
      spy = sinon.spy()
      @userInput = new UserInput()
      @userInput.on 'testEvent', spy
      spy.callCount.should.equal 0

      @userInput