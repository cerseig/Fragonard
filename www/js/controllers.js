angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $stateParams, $state) {
})
.controller('RegisterCtrl', function($scope, $http, $state, $location){
  var userLogin = "", userIut;
  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php'
  }).then(function successCallback(response){
      $scope.iuts = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });

  $scope.registerProcess = function (){
    $http({
        method: 'GET',
        url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php?register='+$scope.userLogin+'&iut='+$scope.userIut
    }).then(function successCallback(response){
        //si l'utilisateur n'est pas déjà pris
        console.log(response);
        if (response.data == "" || response.data == null){
          console.log("ca marche pas");
          userLogin = $scope.userLogin;
          userIut   = $scope.userIut;
          $state.go('app.categories', {userLogin : userLogin, userIut : userIut});
        }
        else {
          $scope.error = response.data;
        }
    }, function myError(response){
        console.log(response.data, response.status);
    });
  }
})
.controller('CategoriesCtrl', function($scope, $http, $state, $location) {
  //Displays all the categories
  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php?user='
  }).then(function successCallback(response){
      $scope.categories = response.data;
      console.log('coucou');
  }, function myError(response){
      console.log(response.data, response.status);
  });
  //Goes to the template to select levels
  $scope.getLevels = function(id) {
    $state.go('app.levels', {categoryId : id}); //Envoyer l'id au controller & de app.levels
  }
})
//Afficher les scores des IUT
.controller('LevelsCtrl', function($scope, $http, $state, $stateParams, $timeout) {
  var categoryId = $stateParams.categoryId;
  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php?category='+$stateParams.categoryId
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
        url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php?category='+categoryId+'&level='+levelId
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
          url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php?category='+categoryId+'&level='+levelId+'&question='+questionId
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
          url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php?question='+questionId
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
        $scope.getNextQuestion(questionId);
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
.controller('ResultCtrl', function($scope, $http, $state, $location){
  var userScore = 0, iutScore;
  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/MMI/ionic/quizz-mmi/www/process/api.php'
  }).then(function successCallback(response){
      $scope.iuts = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });
})
;
