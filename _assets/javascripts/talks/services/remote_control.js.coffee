class RemoteControl
  angular.extend(@prototype, Talks.Utils)
  @$inject = ['$http', '$rootScope', '$window']

  constructor: (@http, @app, _window)->
    @source_host = {
      production: 'plugrc.herokuapp.com',
      development: 'localhost:4000'
    }[@app.env]
    @listeners = []
    # angular.element(_window).on "beforeunload", @exit
    window.__rc = @

  set_key: (key)->
    @key = key

  ready: (callback)->
    @listen(callback)

  onMessage: (callback)->
    @listeners.push callback

  connection_url: ()->
    "//#{@source_host}/remote"

  listen: (callback)->
    @source = new EventSource(@connection_url())
    @source.addEventListener 'message', @callback, false
    @source.addEventListener 'error', @errback, false
    @source.addEventListener 'open', @open, false
    @source.addEventListener 'handshake', @handshake(callback), false
    true

  close_connection: ->
    console.log "closing connection!"
    @source.close()

  callback: (event)=>
    _message = JSON.parse event.data
    console.log '[INFO]:', _message
    return if _.isEmpty(@listeners)
    callback(_message) for callback in @listeners
    true

  errback: (event)=>
    console.log('[ERROR]:', event)

  exit: (event)=>
    console.log '[UNLOAD]'
    @source.close()

  open: (event)=>
    console.log('[CONNECT]:', event)

  handshake: (callback)->
    handshake_callback = (event)->
      message = JSON.parse event.data
      console.log '[HANDSHAKE]: ', event.data
      callback(message.connection_id)
    handshake_callback

  notify: (message)->
    resp = @http.post @connection_url(), message
    resp.error (data, s, h)->
      console.log 'error', data, s, h
    resp.success (data, s, h)->
      console.log 'response', data, s, h
    true

Talks.service 'remoteControl', RemoteControl
