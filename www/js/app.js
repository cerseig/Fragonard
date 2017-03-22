// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('starter', ['ionic', 'starter.controllers', 'starter.directive', 'ui.router', 'ngMap'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.cordova && window.cordova.plugins.Keyboard) {
      // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      // for form inputs)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);

      // Don't remove this line unless you know what you are doing. It stops the viewport
      // from snapping when text inputs are focused. Ionic handles this internally for
      // a much nicer keyboard experience.
      cordova.plugins.Keyboard.disableScroll(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      url: '/app',
      abtract: true,
      templateUrl: 'index.html',
      controller: 'AppCtrl'
    })
    .state('app.register', {
    url: '/register',
    templateUrl: 'templates/register.html',
    controller: 'RegisterCtrl'
    })
    .state('app.categories', {
    url: '/categories',
    templateUrl: 'templates/category.html',
    controller: 'CategoriesCtrl'
    })
    .state('app.levels', {
    url: '/levels/:categoryId',
    templateUrl: 'templates/level.html',
    controller: 'LevelsCtrl'
    })
    .state('app.questions', {
    url: '/questions/:levelId/:categoryId',
    templateUrl: 'templates/questions.html',
    controller: 'QuestionCtrl'
    })
<<<<<<< HEAD
    .state('app.map', {
      url: '/map',
      templateUrl: 'templates/map.html',
      controller: 'MapCtrl'
    });
=======
    .state('app.result', {
    url: '/result',
    templateUrl: 'templates/result.html',
    controller: 'QuestionCtrl'
    })
    ;
>>>>>>> 5e5ace312e6d464c80e230e363a1961542b4c284

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app');
});
