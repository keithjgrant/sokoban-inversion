define ['entities/Block'], (Block) ->

  class Wall extends Block

    isPushable: ->
      false

    getColor: ->
      'WALL'