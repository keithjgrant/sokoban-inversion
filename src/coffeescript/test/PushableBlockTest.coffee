define ['PushableBlock'], (PushableBlock) ->

  describe 'PushableBlock', ->

    it 'should set color', ->
      @block = new PushableBlock {}
      @block.setColor 'blue'

      @block.getColor().should.equal 'blue'

    it 'should set keystone', ->
      @block.isKeystone().should.be.false
      @block.setKeystone()
      @block.isKeystone().should.be.true

    describe 'when neighbors are same color', ->

      beforeEach ->
        @block = new PushableBlock 1, 1
        @block.setColor 'blue'
        whiteBlock = 
          getColor: sinon.stub().returns 'white'
        @neighbors =
          north: whiteBlock
          east: whiteBlock
          south: whiteBlock
          west: whiteBlock
        @block.setNeighbors @neighbors

      it 'should be able to push north', ->
        @block.canPushNorth().should.be.true

      it 'should be able to push east', ->
        @block.canPushEast().should.be.true

      it 'should be able to push south', ->
        @block.canPushSouth().should.be.true

      it 'should be able to push west', ->
        @block.canPushWest().should.be.true

    describe 'when neighbors are different color', ->

      beforeEach ->
        @block = new PushableBlock 1, 1
        @block.setColor 'blue'
        whiteBlock =
          getColor: sinon.stub().returns 'white'
        redBlock =
          getColor: sinon.stub().returns 'red'
        @neighbors =
          north: whiteBlock
          east: whiteBlock
          south: redBlock
          west: redBlock
        @block.setNeighbors @neighbors

      it 'should not be able to push north', ->
        @block.canPushNorth().should.be.false

      it 'should not be able to push east', ->
        @block.canPushEast().should.be.false

      it 'should not be able to push south', ->
        @block.canPushSouth().should.be.false

      it 'should not be able to push west', ->
        @block.canPushWest().should.be.false
