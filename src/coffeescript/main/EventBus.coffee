define ['config'], (config) ->

  class EventBus

    constructor: ->
      @callbacks = []

    on: (eventName, callback) ->
      unless @callbacks[eventName]
        @callbacks[eventName] = []
      @callbacks[eventName].push callback

    one: (eventName, callback) ->
      wrappedCallback = =>
        callback()
        @off eventName, wrappedCallback
      @on eventName, wrappedCallback

    off: (eventName, callback) ->
      for cb, i in @callbacks[eventName] when cb is callback
        @callbacks[eventName].splice i, 1

    trigger: (eventName, payload) ->
      @_logEvent eventName, payload
      if @callbacks[eventName]
        @callbacks[eventName].forEach (callback)->
          callback.call @, payload

    _logEvent: (eventName, payload) ->
      if config.debug
        console.log "> #{eventName}", payload or ''
