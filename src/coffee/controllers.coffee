MainCtrl = ($scope) ->

LoginCtrl = ($scope) ->
  $scope.submit = () ->
    alert 'LoginCtrl.submit("{{$scope.email}}", "{{$scope.password}}")'

TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''