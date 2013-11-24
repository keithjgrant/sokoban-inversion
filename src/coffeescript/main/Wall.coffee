define ->

  class Wall extends Block

    isPushable: ->
      false

    isCoverable: ->
      false

    getColor: ->
      ''