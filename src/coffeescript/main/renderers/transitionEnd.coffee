define ->

  detectBrowserTransitionEndEventName = ->
    style = document.body.style
    if typeof style['transition'] isnt 'undefined'
      'transitionend'
    else if typeof style['webkitTransition'] isnt 'undefined'
      'webkitTransitionEnd'
    else if typeof style['OTransition'] isnt 'undefined'
      'oTransitionEnd'
    else
      ''

  detectBrowserTransitionEndEventName()