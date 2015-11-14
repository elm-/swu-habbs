onReady = ->
  angular.bootstrap document, [ 'app.example' ], strictDi: true


if Meteor.isCordova
  angular.element(document).on 'deviceready', onReady
else
  angular.element(document).ready onReady


app.config [
  '$urlRouterProvider'
  '$stateProvider'
  ($urlRouterProvider, $stateProvider) ->
    $urlRouterProvider.otherwise '/tabs'
    $stateProvider.state 'tabs',
      url: '/tabs'
      templateUrl: 'client/index.ng.html'
      controller: 'TodoCtrl'
    $stateProvider.state 'select-station',
      url: '/select-station'
      templateUrl: 'client/select-station.ng.html'
      controller: 'SelectStationCtrl'
    $stateProvider.state 'create-order',
      url: '/create-order'
      templateUrl: 'client/create-order.ng.html'
      controller: 'CreateOrderCtrl'
    $stateProvider.state 'place-order',
      url: '/place-order'
      templateUrl: 'client/place-order.ng.html'
      controller: 'PlaceOrderCtrl'
    $stateProvider.state 'confirm-order',
      url: '/confirm-order'
      templateUrl: 'client/confirm-order.ng.html'
      controller: 'ConfirmOrderCtrl'

    $stateProvider.state 'order-management',
      url: '/order-management'
      templateUrl: 'client/order-management.ng.html'
      controller: 'OrderManagementCtrl'


]

# subscribe to the two collections we use
Meteor.subscribe 'Orders'
Meteor.subscribe 'Projects'
Meteor.subscribe 'Tasks'