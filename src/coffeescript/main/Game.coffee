define [
  'UserInput'
  'scenes/TitleScene'
  'scenes/LevelSelectScene'
  'scenes/LevelScene'
  'config'
], (UserInput, TitleScene, LevelSelectScene, LevelScene, config) ->

  class Game

    constructor: (@eventBus) ->
      @_initContainer()
      # @loadLevelScene 0
      @loadTitleScene()
      @userInput = new UserInput @eventBus
      @_listenForSceneLoadEvents()

    _listenForSceneLoadEvents: ->
      @eventBus.on 'scene:load:title', @loadTitleScene
      @eventBus.on 'scene:load:levelSelect', @loadLevelSelectScene
      @eventBus.on 'scene:load:level', @loadLevelScene

    _initContainer: ->
      id = config.containerId
      @container = document.getElementById id
      if @container
        # @container.className = ''
      else
        @container = document.createElement 'div'
        @container.id = id
        document.body.appendChild @container
      @_emptyContainer()

    _emptyContainer: ->
      @container.innerHTML = ''

    loadTitleScene: ->
      @_emptyContainer()
      @currentScene = new TitleScene @eventBus, @container

    loadLevelSelectScene: ->
      @_emptyContainer()

    loadLevelScene: (levelNum) ->
      @_emptyContainer()
      @currentScene = new LevelScene @eventBus, @container, levelNum