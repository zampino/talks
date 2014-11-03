@Talks = angular.module 'Talks', ['ngRoute', 'ngAnimate', 'xeditable']
# angular.extend Talks, RegisterTool

Talks.run ['editableOptions', (editableOptions)->
  editableOptions.theme = 'bs3'
]

Talks.run ['$rootScope', (rootScope)->
  _env = angular.element("meta[name='environment']").attr('content')
  rootScope.env = _env
]
