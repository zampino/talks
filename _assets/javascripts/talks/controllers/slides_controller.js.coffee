class SlidesController
  @$inject = ['$rootScope', 'slides', '$location', '$routeParams', 'remoteControl', '$timeout', '$window']

  constructor: (@app, @slides, @location, @params, @remote, @timeout, @w)->
    throw 'already booted' if @booted
    @app.state = 'loading'
    @slides.ready.then =>
      @initialize()

  initialize: ->
    console.log 'slides ready', @slides.size()
    @app.talkId = @params.talkId
    @app.talk = _.findWhere Talks.Index, id: @params.talkId
    @app.slides_count = @slides.size() - 1
    @app.current = parseInt(@location.hash()) || 0
    @slides.go_to @app.current
    @remote.ready (key)=>
      @app.remote_key = key
      # @app.goToRemote = ()=>
      #   @w.open "/talks/remote##{key}", "_blank"
    react = (e)=>
      console.log 'keypressed', e.which
      reaction = @controls["key_#{e.which}"]
      @timeout =>
        reaction.call(@) if _.isFunction(reaction)

    @remote.onMessage react
    @app.keyPressed = react

    @app.state = 'ready'
    @booted = true

  goToSlide: (target)->
    return unless 0 <= target < @slides.size()
    idx = @slides.go_to target
    console.log 'going to target:', target, idx
    @app.$apply =>
      @app.current = idx
      @location.hash idx

  controls:
    key_37: ->
      @goToSlide(@slides.current - 1)

    key_39: ->
      @goToSlide(@slides.current + 1)

Talks.controller 'SlidesController', SlidesController
