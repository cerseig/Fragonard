angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $stateParams, $state) {
})
.controller('AboutCtrl', function($scope, $stateParams, $state) {
})
//Début RegisterCtrl
.controller('RegisterCtrl', function($scope, $http, $state, $location){

  // Formulaire inscription
  var userLogin = "", userIut;
  $http({
      method: 'GET',
      url: 'http://localhost:8888/quizz-mmi/www/process/api.php'
  }).then(function successCallback(response){
      $scope.iuts = response.data;
  });
  // Fin formulaire inscription

  // Process formulaire inscription
  $scope.registerProcess = function (){
    if ($scope.userLogin == null || $scope.userIut == null){
      $scope.error="Veuillez remplir tous les champs."
    }
    else {
      $http({
          method: 'GET',
          url: 'http://localhost:8888/quizz-mmi/www/process/api.php?register='+$scope.userLogin+'&iut='+$scope.userIut
      }).then(function successCallback(response){
          if (response.data == "" || response.data == null){
            userLogin = $scope.userLogin;
            userIut   = $scope.userIut;
            console.log(userLogin);
            console.log(userIut);
            $state.go('app.categories', {userLogin : userLogin, userIut : userIut});
          }
          else {
            $scope.error = response.data;
          }
      });
    }
  }//Fin Formulaire process
})//Fin RegisterCtrl

//Début CategoriesCtrl
.controller('CategoriesCtrl', function($scope, $http, $state, $location, $stateParams) {
    userLogin=$stateParams.userLogin;
    console.log($stateParams.userLogin);
    console.log($stateParams.userLogin);
    console.log(userLogin);
  //Displays all the categories
  $http({
      method: 'GET',
      url: 'http://localhost:8888/quizz-mmi/www/process/api.php?user='
  }).then(function successCallback(response){
      $scope.categories = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });
  //Goes to the template to select levels
  $scope.getLevels = function(id) {
    $state.go('app.levels', {userLogin : userLogin, categoryId : id}); //Envoyer l'id au controller & de app.levels
  }
})//Fin CategoriesCtrl

//Afficher les niveaux
.controller('LevelsCtrl', function($scope, $http, $state, $stateParams, $timeout) {
    var userLogin=$stateParams.userLogin;
    console.log(userLogin);
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
    $state.go('app.questions', {userLogin : userLogin, levelId : id, categoryId : categoryId});
  }
})//Fin affichage niveaux

//Début QuestionCtrl
.controller('QuestionCtrl', function($scope, $http, $stateParams, $timeout, $state) {
  var categoryId, levelId, QuestionId, AnswerId, questions = [], scores = 0, questionsLength, userLogin;
  userLogin=$stateParams.userLogin;
  levelId = $stateParams.levelId;
  categoryId = $stateParams.categoryId;

    //Gets the first question
    $http({
        method: 'GET',
        url: 'http://localhost:8888/quizz-mmi/www/process/api.php?category='+categoryId+'&level='+levelId
    }).then(function successCallback(response){
        $scope.question = response.data;
        questionId = $scope.question.id;
        questionLength = Number(questionId);
        questionLength +=9; //Car 10 questions max / catégorie & / level
        $scope.getAnswers(questionId);
    }, function myError(response){
        console.log(response.data, response.status);
    });

    //Gets the next question
    $scope.getNextQuestion = function(id){
      $scope.correct = ""; //On vide le scope correct
      id = Number(id);
      questionId = id + 1;
      if (questionId < questionLength) {
          console.log(userLogin);
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
      else {
            $state.go('app.result', {scores : scores, userLogin : userLogin});
      }
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
      if (correct == 1) {
           $scope.correct = "fa fa-check";
          $timeout(function () {
              $scope.getNextQuestion(questionId);
          }, 1000);
      }
      else {
         $scope.correct = "fa fa-times";
        $timeout(function () {
            $scope.getNextQuestion(questionId);
        }, 1000);
      }
      $scope.stockScores(correct);
    }
    $scope.stockScores = function(correct){
      scores += Number(levelId * correct);
    }
})
//Fin QuestionCtrl

//Début ResultCtrl
.controller('ResultCtrl', function($scope, $http, $state, $location, $stateParams){
  var userLogin=$stateParams.userLogin;
  scores = $stateParams.scores;

  $http({
      method: 'GET',
      url: 'http://localhost:8888/quizz-mmi/www/process/api.php?score='+scores+'&user='+userLogin
  }).then(function successCallback(response){
      $scope.user = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });

  $scope.getIUTResults = function (iut){
    $state.go('app.result', {iut : iut});
  }
})
//Fin ResultCtrl

//Début ResultsCtrl
.controller('ResultsCtrl', function($scope, $http, $state, $location){
  var iutScore;
  var iut=$stateParams.iut;

  //Affiche tous les IUT avec leurs scores
    $http({
        method: 'GET',
        url: 'http://localhost:8888/quizz-mmi/www/process/api.php'
    }).then(function successCallback(response){
        $scope.iuts = response.data;
    }, function myError(response){
        console.log(response.data, response.status);
    });

  //Si l'user vient de jouer sa partie
    if (iut != null){
      $http({
          method: 'GET',
          url: 'http://localhost:8888/quizz-mmi/www/process/api.php?iut='+iut
      }).then(function successCallback(response){
          $scope.userIut = response.data;
      }, function myError(response){
          console.log(response.data, response.status);
      });
    }
})
//Fin ResultsCtrl
;
