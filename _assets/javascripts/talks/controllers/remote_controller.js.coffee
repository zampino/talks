class RemoteController
  @$inject = ['$scope', '$rootScope', 'remoteControl']

  constructor: (@scope, @app, @remote)->
    console.log 'remote controller boot!'
    @scope.connection =
      key: @app.remote_key || 'enter a key'

    react = (newObj)=>
      console.log 'new key', newObj
      @remote.connect(newObj.key)

    @scope.$watch 'connection', react, true

    @scope.left = =>
      @remote.notify
        which: 37
        type: 'turn'

    @scope.right = =>
      @remote.notify
        which: 39
        type: 'turn'

Talks.controller 'RemoteController', RemoteController
