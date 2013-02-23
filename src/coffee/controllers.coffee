MainCtrl = ($scope) ->
  $scope.submit = () ->
    alert 'MainCtrl.submit() invoked'

LoginCtrl = ($scope) ->
  $scope.submit = () ->
    alert 'LoginCtrl.submit() invoked'

TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    alert 'This is to make sure this is getting called...'

    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''

  $scope.submit = () ->
    alert 'TestCtrl.submit() invoked'