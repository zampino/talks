class SlidesController
  @$inject = ['$location', '$rootScope', '$routeParams']
  constructor: (@location, @root, @params)->
    console.log 'boot slides', params
    root.talkId = params.talkId
    root.current = parseInt(params.slide) || @restoreState() || 0

    root.keyPressed = (e)=>
      console.log 'key pressed!'
      reaction = @controls["key_#{e.which}"]
      reaction.call(@) if reaction

  controls:
    key_37: (location)->
      target = @root.current - 1
      @location.path "#{@params.talkId}/#{target}"

    key_39: (location)->
      target = @root.current + 1
      @location.path "#{@params.talkId}/#{target}"

  restoreState: ->
    storedState = store.get(@params.talkId) || {}
    storedState.slide

Talks.controller 'SlidesController', SlidesController