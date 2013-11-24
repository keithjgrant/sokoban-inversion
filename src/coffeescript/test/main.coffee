requirejs .config
    baseUrl: 'src/javascript/main'

testDir = '../test'
mocha.setup 'bdd'
should = chai.should()

require [
    "#{testDir}/PlayerTest"
    "#{testDir}/PushableBlockTest"
], ->
    mocha.run()

