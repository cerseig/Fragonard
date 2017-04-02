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
      url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php'
  }).then(function successCallback(response){
      $scope.iuts = response.data;
  });
  // Fin formulaire inscription

  // Process formulaire inscription
  $scope.registerProcess = function (){
    //Si l'un des champs n'est pas rempli
    if ($scope.userLogin == null || $scope.userIut == null){
      $scope.error="Veuillez remplir tous les champs." //On affiche le message d'erreur
    }
    else {
      $http({
          method: 'GET',
          url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?register='+$scope.userLogin+'&iut='+$scope.userIut
      }).then(function successCallback(response){
          if (response.data == "" || response.data == null){
            userLogin = $scope.userLogin;
            userIut   = $scope.userIut;
            //On dirige l'utilisateur vers le choix des catégories
            $state.go('app.categories', {userLogin : userLogin, userIut : userIut});
          }
          else {
            $scope.error = response.data;
            // Si l'user est déjà existant on affiche le message d'erreur stocké dans l'API.
          }
      });
    }
  }//Fin Formulaire process
})//Fin RegisterCtrl

//Début CategoriesCtrl
.controller('CategoriesCtrl', function($scope, $http, $state, $location, $stateParams) {
  var userLogin;
  userLogin=$stateParams.userLogin;

  //Affiche toutes les catégories
  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?user='
  }).then(function successCallback(response){
      $scope.categories = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });
  //Va au template pour choisir les niveaux
  $scope.getLevels = function(id) {
    $state.go('app.levels', {userLogin : userLogin, categoryId : id}); //Envoyer l'id au controller & de app.levels
  }
})//Fin CategoriesCtrl

//Afficher les niveaux
.controller('LevelsCtrl', function($scope, $http, $state, $stateParams, $timeout) {
  var userLogin, categoryId;
  userLogin=$stateParams.userLogin;
  categoryId = $stateParams.categoryId;

  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?category='+$stateParams.categoryId
  }).then(function successCallback(response){
      $scope.levels = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });

  //Va au template des Questions
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

    //Affiche la première question
    $http({
        method: 'GET',
        url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?category='+categoryId+'&level='+levelId
    }).then(function successCallback(response){
        $scope.question = response.data;
        questionId = $scope.question.id;
        questionLength = Number(questionId);
        questionLength +=10; //Car 10 questions max / catégorie & / level
        $scope.getAnswers(questionId);
    }, function myError(response){
        console.log(response.data, response.status);
    });

    //Affiche la question suivante
    $scope.getNextQuestion = function(id){
      $scope.correct = ""; //On vide le scope correct
      id = Number(id); //On récupère l'ID de la question d'avant
      questionId = id + 1; //On ajoute un pour la question suivante
      if (questionId < questionLength) {
        //Récupère la question selon son Id
        $http({
            method: 'GET',
            url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?category='+categoryId+'&level='+levelId+'&question='+questionId
        }).then(function successCallback(response){
            $scope.question = response.data;
            $scope.getAnswers(questionId);
        }, function myError(response){
            console.log(response.data, response.status);
        });
      }
      else {
          //Si fin du jeu, on va au template des résultats
            $state.go('app.result', {scores : scores, userLogin : userLogin});
      }
    }

    //Réccupère les réponses correspodant à la question
    $scope.getAnswers = function (questionId){
      $http({
          method: 'GET',
          url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?question='+questionId
      }).then(function successCallback(response){
          $scope.answers = response.data;
      }, function myError(response){
          console.log(response.data, response.status);
      });
    }

    //Vérifie si la réponse choisie est la bonne
    $scope.checkAnswer = function (correct, id) {
      if (correct == 1) {
          //Si la réponse est la bonne, on affiche un "check" vert et on passe à la question suivante
           $scope.correct = "fa fa-check";
          $timeout(function () {
              $scope.getNextQuestion(questionId);
          }, 1000);
      }
      else {
        //Si la réponse est mauvaise, on affiche une croix rouge et on passe à la question suivante
         $scope.correct = "fa fa-times";
        $timeout(function () {
            $scope.getNextQuestion(questionId);
        }, 1000);
      }

      $scope.stockScores(correct); //On appelle le modèle stockScores et on lui envoie "correct"
    }
    $scope.stockScores = function(correct){
      scores += Number(levelId * correct);
      //On ajoute au score les nouveaux points et on les multiplie par le niveau de difficulté
    }
})
//Fin QuestionCtrl

//Début ResultCtrl
.controller('ResultCtrl', function($scope, $http, $state, $location, $stateParams){
  var userLogin, scores;
  userLogin=$stateParams.userLogin;
  scores = $stateParams.scores;

  //Envoie le score de l'user à son "profil" et à son IUT puis affiche son score perso
  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?score='+scores+'&user='+userLogin
  }).then(function successCallback(response){
      $scope.user = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });

  $scope.getIUTResults = function (iut){
    //Va au template results qui affiche les résultats de tous les IUT et envoie l'id de l'iut de l'user
    $state.go('app.results', {iut : iut});
  }
})
//Fin ResultCtrl

//Début ResultsCtrl
.controller('ResultsCtrl', function($scope, $http, $state, $location, $stateParams){
  var iutScore;
  var iut=$stateParams.iut;

  //Affiche tous les IUT avec leurs scores
    $http({
        method: 'GET',
        url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php'
    }).then(function successCallback(response){
        $scope.iuts = response.data;
    }, function myError(response){
        console.log(response.data, response.status);
    });

  //Si l'user vient de jouer sa partie il verra son IUT affiché sur la page Results
    if (iut != null){
      $http({
          method: 'GET',
          url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?iut='+iut
      }).then(function successCallback(response){
          $scope.userIut = response.data;
      }, function myError(response){
          console.log(response.data, response.status);
      });
    }

    console.log($scope.userIut);

  //Si l'utilisateur choisit un IUT, va à la page qui affiche tous les scores de l'IUT choisit
  $scope.getIUTScore = function (iut){
    $state.go('app.scores', {iut : iut});
  }

})
//Fin ResultsCtrl

//Début ScoresCtrl
.controller('ScoresCtrl', function($scope, $http, $state, $location, $stateParams){

  var iut=$stateParams.iut;
  console.log("iut" + iut);

  //Affiche l'IUT choisi
  $http({
      method: 'GET',
      url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?iut='+iut
  }).then(function successCallback(response){
      $scope.iut = response.data;
  }, function myError(response){
      console.log(response.data, response.status);
  });

  //Affiche les scores de l'IUT choisi
    $http({
        method: 'GET',
        url: 'http://localhost/projets-scolaires/mmi/ionic/quizz-mmi/www/process/api.php?iut_id='+iut
    }).then(function successCallback(response){
        if (response.data[0] == null){
          $scope.error="Aucun utilisateur n'a joué pour cet IUT."
        }
        else {
          $scope.users = response.data;
        }
    }, function myError(response){
        console.log(response.data, response.status);
    });

})
//Fin ScoresCtrl
;
