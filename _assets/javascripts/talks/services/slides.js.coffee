class Slides
  @$inject = ['$q']

  constructor: (@$q)->
    @store = []
    @current = 0
    @deferred = @$q.defer()
    @ready = @deferred.promise

  next: ->
    @current += 1 unless @store[@current].nextStep()

  go_to: (idx)->
    return unless (0 <= idx < @size())
    if idx == @current + 1
      @next()
    else
      @current = idx
    @update()

  update: ->
    slide.hide() for slide in @store
    @store[@current].show()
    @current

  size: ->
    @store.length

  push: (slide_controls)->
    @store.push slide_controls

  done: ->
    @deferred.resolve @

Talks.service 'slides', Slides
