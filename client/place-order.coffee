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
      $state.go("confirm-order")
    , 2500)

]
