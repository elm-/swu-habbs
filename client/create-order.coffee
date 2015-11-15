app.controller 'CreateOrderCtrl', [
  '$scope'
  '$meteorCollection'
  '$ionicModal'
  '$state'
  '$rootScope'
  '$ionicSideMenuDelegate'
  '$ionicPopup'
  'dataSession'
  ($scope, $meteorCollection, $ionicModal, $state, $rootScope, $ionicSideMenuDelegate, $ionicPopup, dataSession) ->
    $scope.shop = dataSession.currentOrder.shop
    $scope.selectedProducts = []

    $scope.placeOrder = ->
      dataSession.currentOrder.selectedProducts = $scope.selectedProducts
      dataSession.save()
      $state.go("place-order")


    $scope.addProduct = (product) ->
      $scope.selectedProducts.push(product)

    $scope.totalPrice = ->
      $scope.selectedProducts.reduce(
        (sum, p) -> sum + p.price
      , 0)

    $scope.productCount = (product) ->
      $scope.selectedProducts.filter((p) -> p.id is product.id).length
]
