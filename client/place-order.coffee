app.controller 'PlaceOrderCtrl', [
  '$scope'
  '$meteorCollection'
  '$ionicModal'
  '$state'
  '$rootScope'
  '$ionicSideMenuDelegate'
  '$ionicPopup'
  '$timeout'
  'dataSession'
  ($scope, $meteorCollection, $ionicModal, $state, $rootScope, $ionicSideMenuDelegate, $ionicPopup, $timeout, dataSession) ->
    $scope.shop = dataSession.currentOrder.shop

    $timeout(->
      order = {
        pickupCode: Math.ceil(Math.random() * 999).toString()
        shopId: dataSession.currentOrder.shop.id
        products: dataSession.currentOrder.selectedProducts
      }
      dataSession.currentOrder.order = order
      $state.go("confirm-order")
    , 2500)

]