define ->

  class EventBus

    constructor: ->
      @callbacks = []

    on: (eventName, callback) ->
      unless @callbacks[eventName]
        @callbacks[eventName] = []
      @callbacks[eventName].push callback

    trigger: (eventName, payload) ->
      if @callbacks[eventName]
        @callbacks[eventName].foreach (callback)->
          callback.call @, payload
