TestCtrl = ($scope) ->
  $scope.soviets = ['test1', '2test', 'test-3']

  $scope.addSoviet = () ->
    alert 'This is to make sure this is getting called...'

    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''