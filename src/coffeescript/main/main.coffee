requirejs.config
    baseUrl: '.'

require ['Game', 'EventBus'], (Game, EventBus) ->
  eventBus = new EventBus()
  game = new Game eventBus

