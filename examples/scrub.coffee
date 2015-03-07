{inspect} = require 'util'
{Scrubber} = require '../lib/koding-dnode-protocol'
# 
# Scrubber.stack = [
#   
#   (cursor)->
#     if cursor.node instanceof Error
#       cursor.update '[Error]'
#   
#   (cursor, next)->
#     if 'number' is typeof cursor.node
#       setTimeout ->
#         cursor.update cursor.node + 42
#         next()
#       , 500
#     else next()
#     
#   (cursor, next)->
#     if 'number' is typeof cursor.node
#       setTimeout ->
#         cursor.update cursor.node - Math.PI
#         next()
#       , 200
#     else next()
# ]


obj =
  spam: new TypeError 'you are a small hobbit'
  foo: 10
  bar: 11
  baz: -> 42
  quux: [1,2, -> 'hi']
obj.quux[3] = obj

scrubber = new Scrubber
scrubber.scrub obj, -> console.log JSON.stringify scrubber.toDnodeProtocol()