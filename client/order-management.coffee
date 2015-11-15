app.controller 'OrderManagementCtrl', [
  '$scope'
  '$meteorCollection'
  '$ionicModal'
  '$state'
  '$rootScope'
  '$ionicSideMenuDelegate'
  '$ionicPopup'
  'dataSession'
  ($scope, $meteorCollection, $ionicModal, $state, $rootScope, $ionicSideMenuDelegate, $ionicPopup, dataSession) ->
    $scope.shops = $scope.$meteorCollection(Shops)
    $scope.orders = $scope.$meteorCollection(Orders)


    $timeout(->
      $scope.currentShop = $scope.shops[0]
    , 1000)
]
