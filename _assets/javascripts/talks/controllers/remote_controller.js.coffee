class RemoteController
  @$inject = ['$scope', '$rootScope', 'connection']

  constructor: (@scope, @app, @connection)->

    @scope.left = =>
      @connection.left()

    @scope.right = =>
      @connection.right()

    @scope.connect = =>
      @connection.connect_to(@scope.connection.id)




Talks.controller 'RemoteController', RemoteController
