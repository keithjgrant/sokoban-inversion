define ['config'], (config) ->

  class UserInput

    constructor: (@eventBus) ->
      @_generateKeymap()
      @_registerInputEvents()

    _generateKeymap: ->
      @keymap = {}
      for event, keycodes of config.controls
        for code in keycodes
          @keymap[code] = event

    _registerInputEvents: ->
      document.addEventListener 'keydown', @_handleKeyDown
      document.addEventListener 'keyup', @_handleKeyUp

    _handleKeyDown: (event) =>
      @_triggerEvent 'keydown', event.keycode

    _handleKeyUp: (event) =>
      @_triggerEvent 'keyup', event.keycode

    _triggerEvent: (eventType, keycode) ->
      movement = @keymap[event.keycode]
      if movement
        @eventBus.trigger "user:#{eventType}:#{movement}"
