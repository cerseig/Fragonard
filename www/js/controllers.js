angular.module('starter.controllers', [])

// .controller('MapCtrl', function($scope, $stateParams) {
// })
.controller('AppCtrl', function($scope, $stateParams, $state) {
})
.controller('QuestionCtrl', function($scope, $http) {
    // $scope.questions = {} ;
        $http({
            method: 'GET',
            url: 'http://localhost:8888/process/api.php'
        }).then(function successCallback(response){
            console.log(response.data);
            $scope.questions = response.data;
        }, function myError(response){
            console.log(response.data, response.status);
        });
});
