angular.module 'sovietcat', [], ($routeProvider) ->
  $routeProvider.when '/test',
    templateUrl: 'partials/test.html'
    controller: TestCtrl

  $routeProvider.when '/login',
    templateUrl: 'partials/login.html'
    controller: LoginCtrl

  $routeProvider.otherwise
    redirectTo: '/test'

  #$locationProvider.html5Mode true