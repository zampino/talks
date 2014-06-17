class ApplicationController
  @$inject = ['$scope', '$rootScope']

  constructor: (@scope, @root)->
    scope.$on '$destroy', @saveState

  saveState: =>
    console.log '///// saving state /////'
    alert('foo')
    store.set(@root.talkId, {slide: @root.current})

Talks.controller 'ApplicationController', ApplicationController
