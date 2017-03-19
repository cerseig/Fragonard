angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $stateParams, $state) {
})
<<<<<<< HEAD
.controller('QuestionCtrl', function($scope, $http) {
    // $scope.questions = {} ;
        $http({
            method: 'GET',
            url: 'http://localhost/process/api.php'
        }).then(function successCallback(response){
            console.log(response.data);
            $scope.questions = response.data;
        }, function myError(response){
            console.log(response.data, response.status);
        });
});
=======

.controller('CategoriesCtrl', function($scope, $http, $state, $location) {
  //Displays all the categories
  $http({
      method: 'GET',
      url: 'http://localhost:8888/quizz-mmi/www/process/api.php'
  }).then(function successCallback(response){
      $scope.categories = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });
  //Goes to the template to select levels
  $scope.getLevels = function(id) {
    $state.go('app.levels', {categoryId : id});
  }
})

//Displays all the levels
.controller('LevelsCtrl', function($scope, $http, $state, $stateParams, $timeout) {
  var categoryId = $stateParams.categoryId;
  $http({
      method: 'GET',
      url: 'http://localhost:8888/quizz-mmi/www/process/api.php?category='+$stateParams.categoryId
  }).then(function successCallback(response){
      $scope.levels = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });
  $scope.getQuestions = function(id) {
    $state.go('app.questions', {levelId : id, categoryId : categoryId});
  }
})

.controller('QuestionCtrl', function($scope, $http, $stateParams) {
  var categoryId, levelId, QuestionId, AnswerId, questions = [], scores = 0, questionsLength;
  levelId = $stateParams.levelId;
  categoryId = $stateParams.categoryId;

    //Gets the first question
    $http({
        method: 'GET',
        url: 'http://localhost:8888/quizz-mmi/www/process/api.php?category='+categoryId+'&level='+levelId
    }).then(function successCallback(response){
        $scope.question = response.data;
        questionId = $scope.question.id;
        $scope.getAnswers(questionId);
    }, function myError(response){
        console.log(response.data, response.status);
    });

    //Gets the next question
    $scope.getNextQuestion = function(id){
      id = Number(id);
      questionId = id + 1;
      //Gets the questionId
      $http({
          method: 'GET',
          url: 'http://localhost:8888/quizz-mmi/www/process/api.php?category='+categoryId+'&level='+levelId+'&question='+questionId
      }).then(function successCallback(response){
          $scope.question = response.data;
          $scope.getAnswers(questionId);
      }, function myError(response){
          console.log(response.data, response.status);
      });
    }

    //Gets the answer corresponding to the question
    $scope.getAnswers = function (questionId){
      $http({
          method: 'GET',
          url: 'http://localhost:8888/quizz-mmi/www/process/api.php?question='+questionId
      }).then(function successCallback(response){
          $scope.answers = response.data;
      }, function myError(response){
          console.log(response.data, response.status);
      });
    }

    //Checks if the selected answer is the right one
    $scope.checkAnswer = function (correct, id) {
      console.log(id);
      if (correct == 1){
        $scope.correct = "bonne réponse !";
      }
      else {
        $scope.correct = "mauvaise réponse!";
      }
      $scope.stockScores(correct);
    }
    $scope.stockScores = function(correct){
      scores += Number(levelId * correct);
    }
})
;
>>>>>>> f6e7f5d987bbf4c2d5ea7e87fa46c8b31f52f9a8
