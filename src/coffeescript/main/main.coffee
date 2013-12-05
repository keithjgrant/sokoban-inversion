requirejs.config
    baseUrl: '.'

require ['Game', 'EventBus'], (Game, EventBus) ->

  launchGame = ->
    eventBus = new EventBus()
    game = new Game eventBus

  WebFont.load
    google:
      families: ['Abel', 'Chango']
    active: launchGame
    fontinactive: launchGame


