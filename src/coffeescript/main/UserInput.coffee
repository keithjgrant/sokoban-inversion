define ['config'], (config) ->

  class UserInput

    constructor: (@eventBus) ->
      @_registerEvents()

    _registerEvents: ->
      
