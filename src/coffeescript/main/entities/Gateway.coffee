define ['entities/Block'], (Block) ->

    class Gateway extends Block

      isPushable: ->
        false

      getColor: ->
        'GATE'