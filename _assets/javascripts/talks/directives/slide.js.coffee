Talks.directive 'slide', ->
  linkFn = (scope, element, attributes)->
    updateCurrent = (value)->
      isCurrent = element.data('index') == value
      console.log 'updating', element.data('index'), value, isCurrent
      element.toggleClass('current', isCurrent)

    scope.$watch 'current', (newValue)->
      updateCurrent(newValue)

  link: linkFn
  restrict: 'E'
