requirejs .config
  baseUrl: 'src/javascript/main'

testDir = '../test'
mocha.setup 'bdd'
should = chai.should()

require [
  "#{testDir}/UserInputTest"
  "#{testDir}/EventBusTest"
  "#{testDir}/entities/PlayerTest"
  "#{testDir}/entities/PushableBlockTest"
  "#{testDir}/parser/BlockFactoryTest"
  #"#{testDir}/parser/GoalFactoryTest"
  "#{testDir}/parser/LevelParserTest"
], ->
    mocha.run()

