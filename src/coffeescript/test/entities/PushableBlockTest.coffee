define ['entities/PushableBlock'], (PushableBlock) ->

  describe 'PushableBlock', ->

    it 'should set color', ->
      @block = new PushableBlock {}
      @block.setColor 'blue'

      @block.getColor().should.equal 'blue'

    it 'should set keystone', ->
      @block.isKeystone().should.be.false
      @block.setKeystone()
      @block.isKeystone().should.be.true
