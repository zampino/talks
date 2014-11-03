Talks.Utils =
  randomColor: ->
    letters = '0123456789ABCDEF'.split('')
    color = '#'
    color+= letters[Math.round(Math.random() * 15)] for i in [0..5]
    color

  randomCode: (size)->
    seed = '0123456789abcdefgh'.split('')
    len = seed.length
    id = ''
    id += seed[Math.floor(Math.random() * seed.length)] for i in [0..size]
    id
