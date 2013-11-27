define ['parser/BlockFactory', 'entities/Wall', 'entities/Gateway'], (BlockFactory, Wall, Gateway) ->

  describe 'BlockFactory', ->

    beforeEach ->
      @factory = new BlockFactory()

    it 'should create a wall', ->
      wall = @factory.createBlock 'w', 1, 2
      (wall instanceof Wall).should.be.true