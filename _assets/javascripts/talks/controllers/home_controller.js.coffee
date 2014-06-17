class HomeController
  @$inject = ['$scope', '$location']

  constructor: (@scope, @location)->
    console.log 'boot home'
    scope.talks = Talks.Index
    _.extend scope, _.pick(@, 'start')

  start: =>
    @location.path @scope.talk.id

Talks.controller 'HomeController', HomeController
