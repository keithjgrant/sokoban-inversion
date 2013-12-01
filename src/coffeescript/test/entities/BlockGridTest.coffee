define ['entities/BlockGrid', 'entities/PushableBlock'], (BlockGrid, PushableBlock) ->

  describe 'BlockGrid', ->

    beforeEach ->
      @eventBus = on: sinon.stub()
      @grid = new BlockGrid @eventBus
      @fakeBlocks = [
          getColumn: sinon.stub().returns 1
          getRow: sinon.stub().returns 2
        ,
          getColumn: sinon.stub().returns 3
          getRow: sinon.stub().returns 4
        ,
          getColumn: sinon.stub().returns 5
          getRow: sinon.stub().returns 6
      ]
      @fakeBlocks.forEach (block) =>
        @grid.addBlock block

    it 'should find block by coordinates', ->
      @grid.findBlock(1, 2).should.equal @fakeBlocks[0]
      @grid.findBlock(3, 4).should.equal @fakeBlocks[1]
      @grid.findBlock(5, 6).should.equal @fakeBlocks[2]

    it 'should return null for empty coordinates', ->
      should = chai.should()
      should.equal @grid.findBlock(2, 1), null
      should.equal @grid.findBlock(1, 1), null
      should.equal @grid.findBlock(5, 5), null

    describe 'when pushing', ->

      beforeEach ->
        @blocks = []
        @blocks[0] = new PushableBlock 7, 7
        @blocks[0].setColor 'white'
        @blocks[1] = new PushableBlock 7, 8
        @blocks[1].setColor 'blue'
        @blocks[2] = new PushableBlock 7, 9
        @blocks[2].setColor 'white'
        @blocks.forEach (block) =>
          @grid.addBlock block
        @event =
          getOriginCoords: sinon.stub().returns [7, 7]
          getDestinationCoords: sinon.stub().returns [7, 8]
          getNextCoords: sinon.stub().returns [7, 9]
          resolvePush: sinon.spy()

        onMovementCallback = @eventBus.on.firstCall.args[1]
        onMovementCallback @event

      it 'should resolve PlayerMovementEvent', ->
        @event.resolvePush.calledOnce.should.be.true

      it 'should set new coordinates on pushed block', ->
        @blocks[1].getCoords().should.eql [7, 9]
        @blocks[1].getRow().should.equal 9

      it 'should set new coordinates on block being pushed over', ->
        @blocks[2].getCoords().should.eql [7, 8]
        @blocks[2].getRow().should.equal 8

      it 'should find pushed block at new location', ->
        @grid.findBlock(7, 9).should.equal @blocks[1]

      it 'should find pushed-over block at new location', ->
        @grid.findBlock(7, 8).should.equal @blocks[2]

