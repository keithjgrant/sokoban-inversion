requirejs.config
    baseUrl: '.'

require ['Game', 'EventBus'], (Game, EventBus) ->

  launchGame = ->
    window.eventBus = eventBus = new EventBus()
    game = new Game eventBus

  WebFont.load
    google:
      families: ['Abel', 'Chango']
    active: launchGame
    fontinactive: launchGame


