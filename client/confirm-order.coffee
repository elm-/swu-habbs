app.controller 'ConfirmOrderCtrl', [
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
    $scope.order = dataSession.currentOrder.order
    $scope.selectedProducts = dataSession.currentOrder.selectedProducts

]
