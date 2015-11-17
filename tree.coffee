
module.exports.BaseTree =
class BaseTree
  constructor: (@id, @attr) ->
    @children = []
    @values = []

  add_child: (item, value) ->
    @children.push item
    @values.push value

    @

  is_leaf: ->
    @children.length == 0
