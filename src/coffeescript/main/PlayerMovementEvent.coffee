define ->

  states =
    PENDING: 'pending'
    RESOLVED: 'resolved'
    REJECTED: 'rejected'

  class PlayerMovementEvent

    constructor: (@originCoords, @coordDeltas) ->
      @state = states.PENDING
      @blockPushed = false
      @onSuccess = []
      @onFailure = []

    getState: ->
      @state

    getOriginCoords: ->
      @originCoords

    getDestinationCoords: ->
      col = @originCoords[0] + @coordDeltas[0]
      row = @originCoords[1] + @coordDeltas[1]
      [col, row]

    getNextCoords: ->
      col = @originCoords[0] + 2*@coordDeltas[0]
      row = @originCoords[1] + 2*@coordDeltas[1]
      [col, row]

    resolve: ->
      @state = states.RESOLVED
      for callback in @onSuccess
        callback @

    resolveStep: ->
      console.log 'RESOLVED (step)'
      @blockPushed = false
      @resolve()

    resolvePush: ->
      console.log 'RESOLVED (push)'
      @blockPushed = true
      @resolve()

    isBlockPushed: ->
      @blockPushed

    reject: ->
      console.log 'REJECTED'
      @state = states.REJECTED
      for callback in @onFailure
        callback @

    done: (callback) ->
      if @state is states.PENDING
        @onSuccess.push callback
      else if @state is states.RESOLVED
        callback @

    fail: (callback) ->
      if @state is states.PENDING
        @onFailure.push callback
      else if @state is states.REJECTED
        callback @

    then: (successCallback, failureCallback) ->
      @done successCallback
      @fail failureCallback