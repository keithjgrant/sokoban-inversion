define ['renderers/TitleScreenRenderer'], (TitleScreenRenderer) ->

  class TitleScene

    constructor: (@eventBus, @container) ->
      @_initRenderer()

    _initRenderer: ->
      @renderer = new TitleScreenRenderer @eventBus, @container
