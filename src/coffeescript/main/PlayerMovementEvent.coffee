define ->

  states =
    PENDING: 'pending'
    RESOLVED: 'resolved'
    REJECTED: 'rejected'

  class PlayerMovementEvent

    constructor: (@originCoords, @coordDeltas) ->
      @state = states.PENDING
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
      for callback in @onSuccess
        callback @

    reject: ->
      for callback in @onFailure
        callback @

    done: (callback) ->
      @onSuccess.push callback

    fail: (callback) ->
      @onFailure.push callback

    then: (successCallback, failureCallback) ->
      @done successCallback
      @fail failureCallback