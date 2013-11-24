define ['Block'], (Block) ->

  class Wall extends Block

    isPushable: ->
      false

    isCoverable: ->
      false

    getColor: ->
      ''