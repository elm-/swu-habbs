if (Meteor.isClient)
  @app = angular.module("app.example", [
    'angular-meteor'
    'ui.router'
    'ionic'
    'ngCordova.plugins.datePicker'
  ])
