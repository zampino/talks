class Slides
  @$inject = ['$q']

  constructor: (@$q)->
    console.log 'Slides Provider booted!'
    @store = []
    @deferred = @$q.defer()
    @ready = @deferred.promise

  next: ->
    unless @store[@current].nextStep()
      @showSlide @current + 1
    @current

  go_to: (idx)->
    return unless (0 <= idx < @size())
    return @next() if idx == @current + 1
    @current = idx
    @update()

  update: ->
    slide.hide() for slide in @store
    @store[@current].show()
    @current

  showSlide: (idx)->
    @store[@current].hide()
    @current = idx
    @store[@current].show()
    true

  size: ->
    @store.length

  push: (slide_controls)->
    # @store.push new Talks.Slide(idx, slide)
    console.log 'push', slide_controls
    @store.push slide_controls

  done: ->
    console.log 'done collecting'
    @deferred.resolve @

Talks.service 'slides', Slides
