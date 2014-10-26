class Direct
  @$inject = []
  constructor: ->
    @listeners = {}

  on: (channel, cb)->
    @listeners[channel] ||=[]
    @listeners[channel].push(cb)

  once: (channel, cb)->
    cb.once = true
    @on(channel, cb)

  trigger: (channel, data={})->
    for cb in @listeners[channel]
      doContinue = @execute(cb, data, channel)
      break unless doContinue
      doContinue

  execute: (cb, data, channel)->
    result = cb.call(data.context, data)
    if cb.once
      @listeners[channel] = _.without @listeners[channel], cb
    result

Talks.service 'direct', Direct