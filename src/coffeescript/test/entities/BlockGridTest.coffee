define ['entities/BlockGrid'], (BlockGrid) ->

  describe 'BlockGrid', ->

    beforeEach ->
      @grid = new BlockGrid()
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
