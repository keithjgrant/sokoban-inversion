define ->

  class TitleScreenRenderer

    constructor: (@eventBus, @container) ->
      @_createTitle()
      @_createByline()
      @_createBeginButton()

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
