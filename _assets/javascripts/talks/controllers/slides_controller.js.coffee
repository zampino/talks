class SlidesController
  @$inject = ['$rootScope', 'slides', '$location', '$routeParams']

  constructor: (@app, @slides, @location, @params)->
    throw 'already booted' if @booted
    @app.state = 'loading'
    slides.ready.then =>
      @initialize()

  initialize: ->
    console.log 'slides ready', @slides.size()
    @app.state = 'ready'
    @app.talkId = @params.talkId
    @app.talk = _.findWhere Talks.Index, id: @params.talkId
    @app.current = @location.hash() || 0
    @slides.current = @app.current
    @slides.update()

    # @app.$on '$routeUpdate', (e, newRoute)=>
    #   console.log 'newroute/location', @location.hash()

    @app.keyPressed = (e) =>
      console.log 'keypressed', e.which
      reaction = @controls["key_#{e.which}"]
      reaction.call(@) if _.isFunction(reaction)

    @booted = true

  goToSlide: (target)->
    return unless 0 <= target < @slides.size()
    idx = @slides.go_to target
    @location.hash idx

  controls:
    key_37: ->
      @goToSlide(@slides.current - 1)

    key_39: ->
      @goToSlide(@slides.current + 1)

Talks.controller 'SlidesController', SlidesController
