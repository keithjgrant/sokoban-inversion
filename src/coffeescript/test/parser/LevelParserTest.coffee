define ['parser/LevelParser', 'parser/BlockFactory', 'parser/GoalFactory', 'Level'], (LevelParser, BlockFactory, GoalFactory, Level) ->

  describe 'LevelParser', ->

    beforeEach ->
      @sandbox = sinon.sandbox.create()
      @eventBus =
        on: @sandbox.stub()
      @parser = new LevelParser @eventBus

      @addBlockStub = @sandbox.stub(Level.prototype, 'addBlock').returns {}
      @addGoalStub = @sandbox.stub(Level.prototype, 'addGoal').returns {}
      @setPlayerStub = @sandbox.stub(Level.prototype, 'setPlayer').returns {}

    afterEach ->
      @sandbox.restore()

    describe 'when parsing blocks', ->

      beforeEach ->
        @createBlockStub = @sandbox.stub(BlockFactory.prototype, 'createBlock')
        @createBlockStub.returns {}
        data =
          blocks: ['abc', 'ABC', 'wgw']
          goals: []
          player: [0, 0]
        level = @parser.parse data

      it 'should create blocks', ->
        @createBlockStub.callCount.should.equal 9
        @createBlockStub.getCall(0).args.should.eql ['a', 0, 0]
        @createBlockStub.getCall(1).args.should.eql ['b', 1, 0]
        @createBlockStub.getCall(2).args.should.eql ['c', 2, 0]
        @createBlockStub.getCall(3).args.should.eql ['A', 0, 1]
        @createBlockStub.getCall(4).args.should.eql ['B', 1, 1]
        @createBlockStub.getCall(5).args.should.eql ['C', 2, 1]
        @createBlockStub.getCall(6).args.should.eql ['w', 0, 2]
        @createBlockStub.getCall(7).args.should.eql ['g', 1, 2]
        @createBlockStub.getCall(8).args.should.eql ['w', 2, 2]

      it 'should add blocks to the level', ->
        @addBlockStub.callCount.should.equal 9

    describe 'when parsing goals', ->

      beforeEach ->
        @createGoalStub = @sandbox.stub(GoalFactory.prototype, 'createGoal')
        @createGoalStub.returns {}
        data =
          blocks: []
          goals: [[0, 1, 'w'], [1, 2, 'b'], [2, 3, 'r']]
          player: [0, 0]
        level = @parser.parse data

      it 'should create goals', ->
        @createGoalStub.calledThrice.should.be.true
        @createGoalStub.firstCall.args.should.eql ['w', 0, 1]
        @createGoalStub.secondCall.args.should.eql ['b', 1, 2]
        @createGoalStub.thirdCall.args.should.eql ['r', 2, 3]

      it 'should add goals to the level', ->
        @addGoalStub.calledThrice.should.be.true

    describe 'when parsing player', ->

      beforeEach ->
        data =
          blocks: []
          goals: []
          player: [0, 2]
        level = @parser.parse data

      it 'should add the player to the level', ->
        @setPlayerStub.calledOnce.should.be.true
        player = @setPlayerStub.firstCall.args[0]
        player.getCoords().should.eql [0, 2]
