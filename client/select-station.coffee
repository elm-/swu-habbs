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
    dataSession.currentOrder = {}
    $scope.shops = $scope.$meteorCollection(Shops)

    $scope.createOrder = (shop) ->
      dataSession.currentOrder.shop = shop
      dataSession.save()
      $state.go("create-order")
]
