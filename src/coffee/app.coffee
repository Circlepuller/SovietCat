angular.module('SovietCat', [])
  .config(['$routeProvider', () ->
    $routeProvider
      .when('/test',
        templateUrl: 'partials/test.html',
        controller: TestCtrl
      )
      .otherwise(
        redirectTo: '/test'
      )
  ])