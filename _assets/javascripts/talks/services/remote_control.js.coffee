class RemoteControl
  angular.extend(@prototype, Talks.Utils)
  @$inject = ['$http', '$rootScope']

  constructor: (@http, @app)->
    @key = @randomCode(3)
    @source_host = {
      production: 'warm-hamlet-7183.herokuapp.com',
      development: 'localhost:9292'
    }[@app.env]

    @listen()
    @listeners = []

  ready: (callback)->
    callback(@key)

  onMessage: (callback)->
    @listeners.push callback

  connection_url: ->
    "//#{@source_host}/connections/#{@key}"

  listen: ->
    @source = new EventSource(@connection_url())
    @source.addEventListener 'message', @callback, false
    @source.addEventListener 'error', @errback, false
    @source.addEventListener 'open', @open, false
    @source.addEventListener 'handshake', @handshake, false
    true

  callback: (event, message)=>
    _message = JSON.parse event.data
    console.log '[INFO]:', _message
    return if _.isEmpty(@listeners)
    callback(_message) for callback in @listeners
    true

  errback: (event, message)=>
    console.log('[ERROR]:', event, message)
    # @source.close()

  open: (event, message)=>
    console.log('[CONNECT]:', event, message)

  handshake: (event)=>
    console.log '[HANDSHAKE]:', event.data

  # TODO: move to another service
  connect: (@key)->

  notify: (message)->
    resp = @http.post @connection_url(), message
    resp.error (data, s, h)->
      console.log 'error', data, s, h
    resp.success (data, s, h)->
      console.log 'response', data, s, h
    true

Talks.service 'remoteControl', RemoteControl
