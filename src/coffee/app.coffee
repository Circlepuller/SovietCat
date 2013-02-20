angular.module('sovietcat', [])
  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/test',
        templateUrl: 'partials/test.html',
        controller: TestCtrl
      )
      .otherwise(
        redirectTo: '/test'
      )
  ])