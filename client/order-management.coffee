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
      $scope.orders.filter((o) -> o.shopId is $scope.currentShop.id)

    $timeout(->
      $scope.currentShop = $scope.shops[0]
    , 1000)
]
