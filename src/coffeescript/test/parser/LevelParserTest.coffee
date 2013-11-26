define ['parser/LevelParser', 'Level'], (LevelParser, Level) ->

  describe 'LevelParser', ->

    beforeEach ->
      @sandbox = sinon.sandbox.create()
      @eventBus = @sandbox.stub()
      @parser = new LevelParser @eventBus

      @addBlockStub = @sandbox.stub(Level.prototype, 'addBlock').returns {}
      @addGoalStub = @sandbox.stub(Level.prototype, 'addGoal').returns {}
      @setPlayerStub = @sandbox.stub(Level.prototype, 'setPlayer').returns {}

    afterEach ->
      @sandbox.restore()

    it 'should create a white block', ->
      data =
        blocks: ['w']
        goals: []
        player: [0, 0]
      level = @parser.parse data

      @addBlockStub.calledOnce.should.be.true