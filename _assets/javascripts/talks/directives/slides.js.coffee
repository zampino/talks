Talks.directive 'slides', ->
  linkFn = (scope, element, attributes)->
    slides = element.find('slide')
    if slides.length != 0
      _.each slides, (slide, idx)->
        angular.element(slide).data('index', idx)
      console.log 'slides indexed', slides.length

  link: linkFn
  restrict: 'E'
