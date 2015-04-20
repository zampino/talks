Talks.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider)->
  $routeProvider.
    when('/',
      controller: 'HomeController',
      template: JST['home']()).

    when('/remote',
      controller: 'RemoteController',
      template: JST['remote']()).

    when('/:talkId',
      controller: 'SlidesController',
      template: (params)->
        JST[params.talkId]()
      ,
      reloadOnSearch: false).
    otherwise({template: 'not found'})

  $locationProvider.html5Mode
    enabled: true
    requireBase: true
]
