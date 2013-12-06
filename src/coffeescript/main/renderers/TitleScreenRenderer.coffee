define ['config'], (config) ->

  class TitleScreenRenderer

    constructor: (@eventBus, @container) ->
      @_createBackgroundTile()
      @_createTitle()
      @_createByline()
      @_createBeginButton()

    _createBackgroundTile: ->
      for col in [0...config.columns]
        x = col * config.blockSize
        for row in [0...config.rows]
          y = row * config.blockSize
          tile = @_createDiv '', 'block block-wall'
          tile.style.left = "#{x}px"
          tile.style.top = "#{y}px"
          @container.appendChild tile

    _createTitle: ->
      @container.appendChild @_createDiv 'Sokoban', 'title title-sokoban'
      @container.appendChild @_createDiv 'Inversion', 'title title-inversion'

    _createByline: ->
      @container.appendChild @_createDiv 'an Elucid Blue game', 'byline'

    _createBeginButton: ->
      button = @_createDiv 'Start', 'button button-start'
      button.addEventListener 'click', => @eventBus.trigger 'scene:load:levelSelect'
      @container.appendChild button

    _createDiv: (text, className) ->
      div = document.createElement 'div'
      div.innerHTML = text
      div.className = className
      div
