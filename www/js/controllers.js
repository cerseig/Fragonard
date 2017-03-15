angular.module('starter.controllers', 'starter', [])

.controller('MapCtrl', function($scope, $stateParams) {
})

.controller('HomeCtrl', function($scope, $http) {
  $http({
      method: 'GET',
      url: '../process/api.php'
  }).then(function successCallback(response){
      $scope.questions = response.data;
  });
});

// .controller('HomeCtrl', function($scope, $http) {
//     $scope.questions;
//     $scope.getQuestion = function() {
//         $http({
//             method: 'GET',
//             url: '../process/api.php'
//         }).then(function successCallback(response){
//             $scope.questions = response.data;
//         }, function (response){
//             console.log(response.data, response.status);
//         });
//     }
//     $scope.getQuestion();
// });
