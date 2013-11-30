define ['entities/Block', 'entities/colors'], (Block, colors) ->

    class Gateway extends Block

      isPushable: ->
        false

      getColor: ->
        colors.GATEWAY