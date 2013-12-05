define ->

  # w - wall
  # a - white   A - white keystone
  # b - blue    B - blue keystone
  # c - red     C - red keystone
  # g - gateway

  [
    # quick demo
  #   blocks: [
  #     'wwwwwwwwwwwwwwww'
  #     'wwwwwwwwwwwwwwww'
  #     'wwwwwwwwwwwwwwww'
  #     'wwwwaaaaaaaawwww'
  #     'wwwwaaaaaaaawwww'
  #     'wwwwaaBaaCaawwww'
  #     'wwwwaaaaaaaawwww'
  #     'wwwwaaaaaaaawwww'
  #     'wwwwwwwwwwwwwwww'
  #     'wwwwwwwwwwwwwwww'
  #     'wwwwwwwwwwwwwwww'
  #     'wwwwwwwwwwwwwwww'
  #   ]
  #   goals: [[6, 6, 'b'], [9, 6, 'r']]
  #   player: [5, 4]
  # ,
    # switch-four
    blocks: [
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwaaaaagbabbwww'
      'wwaabaBaaAbbbbww'
      'wwaaawBabbwwAaww'
      'wwawaawabwbbbbww'
      'wwawaawabwbbbbww'
      'wwaawaabbbwwaaww'
      'wwaBaBaaAbAbbbww'
      'wwwbaaagbbbbbwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
    ]
    goals: [[10, 5, 'w'], [10, 6, 'w'], [11, 5, 'w'], [11, 6, 'w'], [4, 5, 'b'], [4, 6, 'b'], [5, 5, 'b'], [5, 6, 'b']]
    player: [2, 5]
  ,
    # vanilla sokoban, tough level
    blocks: [
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwaawaaawwwww'
      'wwwwwaaBaaaaawww'
      'wwwwaaawwBwaawww'
      'wwwwaBawaawawwww'
      'wwwwwwBwaawawwww'
      'wwwwwwaBaaaawwww'
      'wwwwwwBwawaawwww'
      'wwwwwwaaawwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
    ]
    goals: [[8, 5, 'b'], [8, 6, 'b'], [8, 7, 'b'], [9, 5, 'b'], [9, 6, 'b'], [9, 7, 'b']]
    player: [6, 7]
  ,
    [
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
      'wwwwwwwwwwwwwwww'
    ]
  ]