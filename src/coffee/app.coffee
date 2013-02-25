angular.module 'sovietcat', [], ($routeProvider, $locationProvider) ->
  $routeProvider.when '/test',
    templateUrl: 'partials/test.html'
    controller: TestCtrl

  $routeProvider.when '/login',
    templateUrl: 'partials/login.html'
    controller: LoginCtrl

  $routeProvider.otherwise
    redirectTo: '/test'

  # Enable this when everything's setup
  $locationProvider.html5Mode true