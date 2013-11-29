define ['parser/GoalFactory'], (GoalFactory) ->

  describe 'GoalFactory', ->

    beforeEach ->
      @factory = new GoalFactory()

    it 'should create white goal', ->
      goal = @factory.createGoal 'w', 1, 3
      goal.getColor().should.equal 'white'
      goal.getCoords().should.eql [1, 3]

    it 'should create blue goal', ->
      goal = @factory.createGoal 'b', 1, 3
      goal.getColor().should.equal 'blue'
      goal.getCoords().should.eql [1, 3]

    it 'should create red goal', ->
      goal = @factory.createGoal 'r', 1, 3
      goal.getColor().should.equal 'red'
      goal.getCoords().should.eql [1, 3]
