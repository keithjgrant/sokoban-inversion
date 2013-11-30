define ['entities/Block', 'entities/colors'], (Block, colors) ->

  class Wall extends Block

    isPushable: ->
      false

    getColor: ->
      colors.WALL