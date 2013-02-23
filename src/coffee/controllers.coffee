MainCtrl = ($scope) ->

LoginCtrl = ($scope) ->
  $scope.submit = () ->
    alert 'LoginCtrl.submit("' + $scope.email + '", "' + $scope.password + '", "' + $scope.remember.toString() + '")'

TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''