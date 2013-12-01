define ['scenes/LevelScene'], (LevelScene) ->
  # TODO: Use a SceneFactory?

  class Game

    constructor: (@eventBus) ->
      @loadLevelScene 0

    loadTitleScene: ->

    loadLevelScene: (levelNum) ->
      @currentScene = new LevelScene @eventBus, levelNum