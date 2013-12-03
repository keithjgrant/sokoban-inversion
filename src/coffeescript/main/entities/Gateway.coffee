define ['entities/Block', 'entities/colors'], (Block, colors) ->

    class Gateway extends Block

      isPushable: ->
        false

      isGateway: ->
        true

      getColor: ->
        colors.GATEWAY