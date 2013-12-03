define ['UserInput', 'scenes/TitleScene', 'scenes/LevelSelectScene', 'scenes/LevelScene'], (UserInput, TitleScene, LevelSelectScene, LevelScene) ->

  class Game

    constructor: (@eventBus) ->
      @loadLevelScene 0
      @userInput = new UserInput @eventBus
      @_listenForSceneLoadEvents()

    _listenForSceneLoadEvents: ->
      @eventBus.on 'scene:load:title', @loadTitleScene
      @eventBus.on 'scene:load:levelSelect', @loadLevelSelectScene
      @eventBus.on 'scene:load:level', @loadLevelScene

    loadTitleScene: ->

    loadLevelSelectScene: ->

    loadLevelScene: (levelNum) ->
      @currentScene = new LevelScene @eventBus, levelNum