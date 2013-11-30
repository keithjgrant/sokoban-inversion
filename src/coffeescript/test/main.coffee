requirejs .config
  baseUrl: 'src/javascript/main'

testDir = '../test'
mocha.setup 'bdd'
should = chai.should()

require [
  "#{testDir}/UserInputTest"
  "#{testDir}/EventBusTest"
  "#{testDir}/LevelTest"
  "#{testDir}/GameTest"
  "#{testDir}/entities/PlayerTest"
  "#{testDir}/entities/PushableBlockTest"
  "#{testDir}/entities/BlockGridTest"
  "#{testDir}/parser/BlockFactoryTest"
  "#{testDir}/parser/GoalFactoryTest"
  "#{testDir}/parser/LevelParserTest"
  "#{testDir}/scenes/LevelSceneTest"
], ->
    mocha.run()

