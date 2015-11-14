Meteor.publish 'Orders', ->
  Orders.find({})
Meteor.publish 'Tasks', ->
  Tasks.find({})
Meteor.publish 'Projects', ->
  Projects.find({})

Orders.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Projects.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Tasks.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true


Meteor.startup ->
  if (Orders.find({}).count() is 0)
    Orders.insert({test: "123"})

  Orders.find().forEach (o) -> console.log o
  Tasks.find().forEach (o) -> console.log o
  Projects.find().forEach (o) -> console.log o