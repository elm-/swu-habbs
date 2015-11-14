Meteor.publish 'Orders', ->
  Orders.find({})


Meteor.startup ->
  if (Orders.find({}).count() is 0)
    Orders.insert({test: "123"})
  Orders.find().forEach (o) -> console.log o