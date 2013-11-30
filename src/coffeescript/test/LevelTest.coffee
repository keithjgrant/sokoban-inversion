define ['Level'], (Level) ->

  describe 'Level', ->

    beforeEach ->
      @level = new Level()

    it 'should pass BlockGrid into goals', ->
      fakeBlock =
        getColumn: sinon.stub().returns 2
        getRow: sinon.stub().returns 1
      @level.addBlock fakeBlock
      fakeGoal = isSatisfied: sinon.spy()
      @level.addGoal fakeGoal

      @level.isComplete()

      fakeGoal.isSatisfied.calledOnce.should.equal true, 'isSatisfied() called'
      blockGrid = fakeGoal.isSatisfied.firstCall.args[0]
      blockGrid.findBlock(2, 1).should.equal fakeBlock, 'block should be in the blockGrid'

    describe 'when goals not satisfied', ->

      beforeEach ->
        fakeGoalOne = isSatisfied: sinon.stub().returns false
        fakeGoalTwo = isSatisfied: sinon.stub().returns true
        @level.addGoal fakeGoalOne
        @level.addGoal fakeGoalTwo

      it 'should report incomplete', ->
        @level.isComplete().should.be.false

    describe 'when goals all satisfied', ->

      beforeEach ->
        fakeGoalOne = isSatisfied: sinon.stub().returns true
        fakeGoalTwo = isSatisfied: sinon.stub().returns true
        @level.addGoal fakeGoalOne
        @level.addGoal fakeGoalTwo

      it 'should report complete', ->
        @level.isComplete().should.be.true