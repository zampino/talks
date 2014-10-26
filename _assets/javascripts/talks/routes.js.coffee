Talks.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider)->
  $routeProvider.
    when('/',
      controller: 'HomeController',
      template: JST['home']()).
    when('/:talkId',
      controller: 'SlidesController',
      template: (params)->
        JST[params.talkId]()
      ,
      reloadOnSearch: false).
    when('/remote',
      controller: 'RemoteController',
      template: JST['remote']()).
    otherwise({template: 'not found'})

  $locationProvider.html5Mode(true)
]
