define ['parser/BlockFactory', 'entities/Wall', 'entities/Gateway'], (BlockFactory, Wall, Gateway) ->

  describe 'BlockFactory', ->

    beforeEach ->
      @factory = new BlockFactory()

    it 'should create a wall', ->
      wall = @factory.createBlock 'w', 1, 2
      (wall instanceof Wall).should.be.true
      wall.getCoords().should.eql [1, 2]

    it 'should create a gateway', ->
      gateway = @factory.createBlock 'g', 1, 2
      (gateway instanceof Gateway).should.be.true
      gateway.getCoords().should.eql [1, 2]

    it 'should create a white block', ->
      block = @factory.createBlock 'a', 1, 2
      block.getColor().should.equal 'white'
      block.getCoords().should.eql [1, 2]

    it 'should create a white keystone block', ->
      block = @factory.createBlock 'A', 1, 2
      block.getColor().should.equal 'white'
      block.getCoords().should.eql [1, 2]
      block.isKeystone().should.be.true

    it 'should create a blue block', ->
      block = @factory.createBlock 'b', 1, 2
      block.getColor().should.equal 'blue'
      block.getCoords().should.eql [1, 2]

    it 'should create a blue keystone block', ->
      block = @factory.createBlock 'B', 1, 2
      block.getColor().should.equal 'blue'
      block.getCoords().should.eql [1, 2]
      block.isKeystone().should.be.true

    it 'should create a red block', ->
      block = @factory.createBlock 'c', 1, 2
      block.getColor().should.equal 'red'
      block.getCoords().should.eql [1, 2]

    it 'should create a red keystone block', ->
      block = @factory.createBlock 'C', 1, 2
      block.getColor().should.equal 'red'
      block.getCoords().should.eql [1, 2]
      block.isKeystone().should.be.true
