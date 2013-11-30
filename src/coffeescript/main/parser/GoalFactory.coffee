define ['entities/Goal', 'entities/colors'], (Goal, colors) ->

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
      goal.setColor colors.WHITE
      goal

    _createBlue: (col, row) ->
      goal = new Goal col, row
      goal.setColor colors.BLUE
      goal

    _createRed: (col, row) ->
      goal = new Goal col, row
      goal.setColor colors.RED
      goal
