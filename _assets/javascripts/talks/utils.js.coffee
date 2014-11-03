Talks.Utils =
  randomColor: ->
    letters = '0123456789ABCDEF'.split('')
    color = '#'
    color+= letters[Math.round(Math.random() * 15)] for i in [0..5]
    color

  randomCode: ->
    seed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".split('')
    len = seed.length
    id = ""
    id += seed[Math.round(Math.random() * seed.length)] for i in [0..14]
    id
