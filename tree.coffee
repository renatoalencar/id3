
module.exports.BaseTree =
class BaseTree

  #
  # Creates a tree instance
  #
  # @constructor
  # @param id - the node's id
  # @param attr - the node's attribute
  constructor: (@id, @attr) ->
    @children = []
    @values = []

  #
  # Add a child to the node
  #
  # @param item - a item objec, eg.: a BaseTree object
  # @param value - the value of the edge
  add_child: (item, value) ->
    @children.push item
    @values.push value

    @

  #
  # Returns if a node is a leaf
  #
  is_leaf: ->
    @children.length == 0
