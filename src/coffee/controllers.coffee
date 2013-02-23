MainCtrl = ($scope) ->

LoginCtrl = ($scope) ->
  $scope.submit = () ->
    alert 'LoginCtrl.submit() invoked'

TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''