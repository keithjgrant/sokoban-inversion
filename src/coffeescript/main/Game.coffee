define ['scenes/LevelScene'], (LevelScene) ->
  # TODO: Use a SceneFactory?

  class Game

    constructor: (@eventBus) ->
      @loadTitleScene()

    loadTitleScene: ->

    loadLevelScene: (levelNum) ->
      @currentScene = new LevelScene levelNum