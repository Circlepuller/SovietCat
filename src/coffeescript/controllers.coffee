TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    $scope.soviets.push($scope.sovietText)

    $scope.sovietText = '';