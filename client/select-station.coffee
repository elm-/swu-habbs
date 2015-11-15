app.controller 'SelectStationCtrl', [
  '$scope'
  '$meteorCollection'
  '$ionicModal'
  '$state'
  '$rootScope'
  '$ionicSideMenuDelegate'
  '$ionicPopup'
  'dataSession'
  ($scope, $meteorCollection, $ionicModal, $state, $rootScope, $ionicSideMenuDelegate, $ionicPopup, dataSession) ->
    names = [
      "Randall Campbell"
      "Lynne Neal"
      "Priscilla Holt"
      "Roderick Hanson"
      "Jackie Moody"
      "Jeannette Harper"
      "Verna Sims"
      "Harvey Burgess"
      "Josephine Hunt"
      "Gladys Fleming"
      "Shaun Steele"
      "Lonnie Dean"
      "Jeffrey Boone"
      "Kent Day"
      "Peter Washington"
      "Johnny Beck"
      "Phillip Cooper"
      "Lewis Carr"
      "Evelyn Grant"
      "Emma Stephens"
      "Ron Castro"
      "Preston Ryan"
      "Van Norman"
      "Jody Thornton"
      "Jean Bowen"
    ]


    dataSession.currentOrder = {}
    $scope.shops = $scope.$meteorCollection(Shops)

    $scope.createOrder = (shop) ->
      dataSession.currentOrder.shop = shop
      dataSession.currentOrder.pickupTime = "17:" + (Math.floor(Math.random() * 50) + 10)
      dataSession.currentOrder.username = names[Math.floor(Math.random() * names.length)]
      dataSession.save()
      $state.go("create-order")
]
