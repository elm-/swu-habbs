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
        name: "Big King"
        price: 3.75
      ,
        id: "2"
        name: "Long chicken"
        price: 3.75
      ,
        id: "3"
        name: "Double whopper"
        price: 4.75
      ,
        id: "4"
        name: "Steakhouse burger"
        price: 5.25
      ,
        id: "5"
        name: "Cheese burger"
        price: 2.75
      ]
    )
    Shops.insert(
      _id: "2"
      name: "DeBroodzaak"
      logo: "broodzaak.png"
      cover: "broodzaak-cover.jpg"
      products: [
        id: "1"
        name: "Boterham kipfilet bacon"
        price: 2.25
      ,
        id: "2"
        name: "Boterham tonijnsalade"
        price: 2.25
      ,
        id: "3"
        name: "Pistolet ham/kaas"
        price: 2.25
      ,
        id: "4"
        name: "pistolet kaas"
        price: 2.25
      ,
        id: "5"
        name: "pistolet filet americain "
        price: 2.95
      ]
    )
    Shops.insert(
      _id: "3"
      name: "Julia's"
      logo: "julias.png"
      cover: "julias-cover.jpg"
      products: [
        id: "1"
        name: "Bolognese"
        price: 5.50
      ,
        id: "2"
        name: "Arrabiata"
        price: 5.50
      ,
        id: "3"
        name: "Carbonara"
        price: 6.00
      ,
        id: "4"
        name: "Tonijn"
        price: 3.50
      ,
        id: "5"
        name: "Mozzarella tomaat"
        price: 3.50
      ]
    )
    Shops.insert(
      _id: "4"
      name: "Kiosk"
      logo: "kiosk.png"
      cover: "kiosk-cover.jpg"
      products: [
        id: "1"
        name: "Coffee"
        price: 1.25
      ,
        id: "2"
        name: "crossaint cheese"
        price: 1.50
      ,
        id: "3"
        name: "crossaint cheese/bacon"
        price: 1.50
      ,
        id: "4"
        name: "Mars"
        price: 1.00
      ,
        id: "5"
        name: "apple"
        price: 0.75
      ]
    )
    Shops.insert(
      _id: "5"
      name: "Smullers"
      logo: "smullers.png"
      cover: "smullers-cover.jpg"
      products: [
        id: "1"
        name: "Patat"
        price: 1.75
      ,
        id: "2"
        name: "Cheeseburger"
        price: 3.15
      ,
        id: "3"
        name: "kroket"
        price: 1.00
      ,
        id: "4"
        name: "Cola"
        price: 1.25
      ,
        id: "5"
        name: "frinkandel"
        price: 1.00
      ]
    )
    Shops.insert(
      _id: "6"
      name: "Star Bucks"
      logo: "starbucks.png"
      cover: "starbucks-cover.jpg"
      products: [
        id: "1"
        name: "Caffet Latte"
        price: 3.15
      ,
        id: "2"
        name: "Cappucino"
        price: 3.15
      ,
        id: "3"
        name: "espresso"
        price: 2.05
      ,
        id: "4"
        name: "Caramel maachiato"
        price: 4.05
      ,
        id: "5"
        name: "White Caffe Mocha "
        price: 4.05
      ]
    )

  #to clean db
  #Orders.remove({})
  Orders.find().forEach (o) -> console.log o
  Shops.find().forEach (o) -> console.log o