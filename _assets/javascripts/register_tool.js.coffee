@RegisterTool =
  _register: (klass)->
    controller_name = klass.toString().match(/function\s*(.*?)\(/)[1]
    this.controller controller_name, klass


    klass.inject = (args...)->
      klass.$inject = args

    class Ctor
      constructor: ->
        @constructor = klass

    class ControllerBase
      constructor: (args...)->
        @foo = 'bar'
        console.log('hallo!', args)
        @initialize?()

    Ctor.prototype = ControllerBase.prototype
    klass.prototype = new Ctor

    true
