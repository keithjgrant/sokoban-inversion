define ['scenes/LevelScene', 'UserInput'], (LevelScene, UserInput) ->
  # TODO: Use a SceneFactory?

  class Game

    constructor: (@eventBus) ->
      @loadLevelScene 0
      @userInput = new UserInput @eventBus

    loadTitleScene: ->

    loadLevelScene: (levelNum) ->
      @currentScene = new LevelScene @eventBus, levelNum