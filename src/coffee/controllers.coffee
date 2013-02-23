TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    alert 'This is to make sure this is getting called...'

    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''