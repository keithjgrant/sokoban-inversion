define ['entities/Goal'], (Goal) ->

  class GoalFactory

    constructor: ->
      @goalByChar =
        w: @_createWhite
        b: @_createBlue
        r: @_createRed

    createGoal: (char, col, row) ->
      func = @goalByChar[char]
      func col, row

    _createWhite: (col, row) ->
      goal = new Goal col, row
      goal.setColor 'white'
      goal

    _createBlue: (col, row) ->
      goal = new Goal col, row
      goal.setColor 'blue'
      goal

    _createRed: (col, row) ->
      goal = new Goal col, row
      goal.setColor 'red'
      goal
