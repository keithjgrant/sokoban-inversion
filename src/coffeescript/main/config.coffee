define ->

  keycodes =
    W: 87
    A: 65
    S: 83
    D: 68
    UP_ARROW: 38
    DOWN_ARROW: 40
    LEFT_ARROW: 37
    RIGHT_ARROW: 39
    ESC: 27
    ENTER: 13
    SPACEBAR: 32

  controls:
    up: [keycodes.W, keycodes.UP_ARROW]
    down: [keycodes.S, keycodes.DOWN_ARROW]
    left: [keycodes.A, keycodes.LEFT_ARROW]
    right: [keycodes.D, keycodes.RIGHT_ARROW]
    esc: [keycodes.ESC]
    select: [keycodes.ENTER, keycodes.SPACEBAR]
  tileSize: 32
  debug: true