Talks.directive 'listenkeydown', ()->
  (scope, elm, attr)->
    console.log 'linked keydown'
    elm.on 'keydown', (e)->
      console.log 'now please listen to mne', e