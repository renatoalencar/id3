
{BaseTree} = require './tree'

class ID3 extends BaseTree
  constructor: (@table, @classname) ->

  attr_column: (attr) ->
    attr_index = @table[0].indexOf attr
    (i[attr_index] for i in @table)[1..]

  class_entropy: ->
    classes = []
    classes.push i for i in @attr_column(@classname) when not i in classes

    entropy = 0
    for i in classes
      count = 0
      count++ for j in @class_column() when i == j

      entropy -= (Math.log(count/@class_column().length)/Math.log(2))*count/@class_column()

    entropy

  attr_information_gain: (attr) ->
