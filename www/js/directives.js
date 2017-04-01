angular.module('starter.directives', [])
.directive('card', function() {
  return {
    restrict : 'E', //pour dire que la directive est un Element : une balise ( ici <card>)
    scope : {title: '=title'}, //on lui dit ce qu'il peut voir : ici l'attr title
    templateUrl : 'templates/card.html'
  }
});
