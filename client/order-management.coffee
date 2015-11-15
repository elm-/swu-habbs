app.controller 'OrderManagementCtrl', [
  '$scope'
  '$meteorCollection'
  '$ionicModal'
  '$state'
  '$rootScope'
  '$ionicSideMenuDelegate'
  '$ionicPopup'
  'dataSession'
  '$timeout'
  ($scope, $meteorCollection, $ionicModal, $state, $rootScope, $ionicSideMenuDelegate, $ionicPopup, dataSession, $timeout) ->
    $scope.shops = $scope.$meteorCollection(Shops)
    $scope.orders = $scope.$meteorCollection(Orders)

    $scope.filteredOrders = ->
      $scope.orders
      .filter((o) -> o.shopId is $scope.currentShop.id)
      .sort((a, b) ->
        if (a.pickedUp)
          1
        else if (b.pickedUp)
          -1
        else
          a.pickupTime < b.pickupTime
      )

    $scope.setActiveOrder = (order) ->
      $scope.activeOrder = order

    $scope.pickedUp = (order) ->
      order.pickedUp = not order.pickedUp

    $timeout(->
      $scope.currentShop = $scope.shops[0]
    , 1000)
]
