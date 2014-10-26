Talks.directive 'slide', ['slides', (slides) ->

  linkFn = (scope, element, attributes)->
    # isCurrent = null
    # slideObject = null

    console.log "link slide: #{attributes.title}"
    controls =
      hide: -> element.removeClass 'current'
      show: -> element.addClass 'current'
      nextStep: ->
        steps = element.find('.step')
        hasSteps = steps.size() > 0
        if hasSteps
          steps.first().removeClass('step')
        hasSteps

    slides.push controls

  link: linkFn
  restrict: 'E'
]
