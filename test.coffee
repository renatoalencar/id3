
fs = require 'fs'
id3 = require './id3'

table = JSON.parse fs.readFileSync 'table.json'

tree = new id3.ID3 table, 'emprestimo'

test_entropy = ->
  console.log tree.entropy tree.attr_column 'emprestimo'

test_unique_values = ->
  console.log tree.unique_values 'emprestimo'

test_attr_entropy = ->
  console.log tree.attr_entropy 'emprestimo'
  console.log tree.attr_entropy 'montante'

test_gain = ->
  console.log tree.gain 'montante'

test_better_attr = ->
  console.log tree.better_attr()


test_entropy()
test_unique_values()
test_attr_entropy()
test_gain()
test_better_attr()
