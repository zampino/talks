@Talks = angular.module 'Talks', ['ngRoute', 'ngAnimate', 'xeditable']
# angular.extend Talks, RegisterTool

Talks.run ['editableOptions', (editableOptions)->
  editableOptions.theme = 'bs3'
]
