Talks.directive 'slideframe', ['$rootScope', 'slides', (root, slides)->

  linkFn = (scope, element, attributes)->
    console.log 'linking slideframe!!'
    slideElements = element.find('slide')
    return if slideElements.size() == 0
    # FIXME: find a more explicit event!!!
    slides.done()

  link: linkFn
  restrict: 'E'
]
