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
], ->
    mocha.run()

