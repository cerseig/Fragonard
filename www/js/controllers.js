angular.module('starter.controllers', [])

// .controller('MapCtrl', function($scope, $stateParams) {
// })
.controller('AppCtrl', function($scope, $stateParams, $state) {
})
.controller('QuestionCtrl', function($scope, $http) {
    $scope.questions;
    $scope.getQuestion = function() {
        $http({
            method: 'GET',
            url: '../process/api.php'
        }).then(function successCallback(response){
            console.log(response.data);
            $scope.questions = response.data;
        }, function (response){
            console.log(response.data, response.status);
        });
    }
    $scope.getQuestion();
})
.controller('MapCtrl', function($scope, $stateParams) {
})
.controller('NavCtrl', function($scope, $ionicHistory) {
  $scope.myGoBack = function() {
    $ionicHistory.goBack();
  };
});
