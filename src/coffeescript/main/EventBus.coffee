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
        @callbacks[eventName].forEach (callback)->
          callback.call @, payload
