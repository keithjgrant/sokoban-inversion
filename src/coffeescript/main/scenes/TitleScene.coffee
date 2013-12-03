define ['renderers/TitleScreenRenderer'], (TitleScreenRenderer) ->

  class TitleScene

    constructor: (@eventBus) ->
      @_initRenderer()

    _initRenderer: ->
      @renderer = new TitleScreenRenderer @eventBus
