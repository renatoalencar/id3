
{BaseTree} = require './tree'

module.exports.ID3 =
class ID3 extends BaseTree

  #
  # Creates a ID3 instance.
  #
  # @constructor
  # @param table - training set
  # @param classname - the class attribute of the training set
  #
  constructor: (@table, @classname) ->

  #
  # Returns a list of values of a column
  #
  # @param attr - a attribute name
  #
  attr_column: (attr) ->
    attr_index = @table[0].indexOf attr
    (i[attr_index] for i in @table)[1..]

  #
  # Returns the possible values of a attribute
  #
  # @param attr - the attribute name
  #
  unique_values: (attr) ->
    values = []
    values.push i for i in @attr_column attr when i not in values
    values

  #
  # Returns a object with the entropy of each value of the attribute
  #
  # @param attr - the attribute name
  #
  attr_entropy: (attr) ->
    column = @attr_column attr
    class_column = @attr_column @classname
    entropy = {}

    for i in @unique_values attr
      line = []
      for j in [0...column.length]
        if column[j] == i
          line.push class_column[j]
      entropy[i] = @entropy line

    entropy

  #
  # Calculates the information gain of a attribute
  #
  # @param attr - the attribute name
  #
  gain: (attr) ->
    entropy = @attr_entropy attr
    gain = @entropy @attr_column @classname
    count = {}
    column = @attr_column attr

    for i in column
      if count[i]?
        count[i]++
      else
        count[i] = 1

    for value, ent of entropy
      gain -= (count[value]/column.length)*ent

    gain

  #
  # Returns the name of the attribute with greater information gain
  #
  better_attr: ->
    better = 0
    for i in [1...@table[0].length-1]
      if @gain(@table[0][i]) > @gain(@table[0][better])
        better = i

    @table[0][better]

  #
  # Calculates the entropy of a list
  #
  # @param list - a list of objects of any type
  entropy: (list) ->
    count = {}

    for i in list
      if count[i]?
        count[i]++
      else
        count[i] = 1

    entropy = 0

    for attr, c of count
      p = c/list.length
      entropy -= Math.log(p)*p/Math.log(2)

    entropy
