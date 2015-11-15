Meteor.publish 'Orders', ->
  Orders.find({})
Meteor.publish 'Shops', ->
  Shops.find({})
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

Shops.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true


Meteor.startup ->
  Shops.remove({})
  if (Shops.find({}).count() is 0)
    Shops.insert(
      _id: "1"
      name: "Burger King"
      logo: "burgerking.png"
      cover: "burgerking-cover.jpg"
      products: [
        id: "1"
        name: "Burger 1"
        price: 4.99
      ,
        id: "2"
        name: "Burger 2"
        price: 4.99
      ,
        id: "3"
        name: "Burger 3"
        price: 4.99
      ]
    )
    Shops.insert(
      _id: "2"
      name: "DeBroodzaak"
      logo: "broodzaak.png"
      cover: "broodzaak-cover.jpg"
    )
    Shops.insert(
      _id: "3"
      name: "Julia's"
      logo: "julias.png"
      cover: "julias-cover.jpg"
    )
    Shops.insert(
      _id: "4"
      name: "Kiosk"
      logo: "kiosk.png"
      cover: "kiosk-cover.jpg"
    )
    Shops.insert(
      _id: "5"
      name: "Smullers"
      logo: "smullers.png"
      cover: "smullers-cover.jpg"
    )
    Shops.insert(
      _id: "6"
      name: "Star Bucks"
      logo: "starbucks.png"
      cover: "starbucks-cover.jpg"
    )

  #to clean db
  #Orders.remove({})
  Orders.find().forEach (o) -> console.log o
  Shops.find().forEach (o) -> console.log o