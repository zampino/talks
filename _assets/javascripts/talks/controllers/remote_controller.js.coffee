class RemoteController
  @$inject = ['$scope', '$rootScope', 'remoteControl', '$location']

  constructor: (@scope, @app, @remote, @location)->
    console.log 'remote controller boot!'
    key = @location.hash() || @app.remote_key || 'enter a key'
    @scope.connection =
      key: key
    @remote.set_key key

    react = (newObj)=>
      console.log 'new key', newObj
      @remote.set_key newObj.key

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
