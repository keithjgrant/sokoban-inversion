define ['config'], (config) ->

  class UserInput

    constructor: (@eventBus) ->
      @_generateKeymap()
      @_registerInputEvents()

    _generateKeymap: ->
      @keymap = {}
      for event, keyCodes of config.controls
        for code in keyCodes
          @keymap[code] = event

    _registerInputEvents: ->
      document.addEventListener 'keydown', @_handleKeyDown
      document.addEventListener 'keyup', @_handleKeyUp

    _handleKeyDown: (event) =>
      @_triggerEvent 'keydown', event.keyCode

    _handleKeyUp: (event) =>
      @_triggerEvent 'keyup', event.keyCode

    _triggerEvent: (eventType, keyCode) ->
      movement = @keymap[event.keyCode]
      if movement
        @eventBus.trigger "user:#{eventType}:#{movement}"
