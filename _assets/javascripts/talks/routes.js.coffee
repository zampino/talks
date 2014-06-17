Talks.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider)->
  $routeProvider.
    when('/',
      controller: 'HomeController',
      template: JST['home']()).
    when('/:talkId/:slide?',
      controller: 'SlidesController',
      template: (params)->
        JST[params.talkId]()).
    otherwise({template: 'not found'})

  $locationProvider.html5Mode(true)
]
