MainCtrl = ($scope) ->

LoginCtrl = ($scope) ->
  $scope.submit = () ->
    email = if $scope.email? then $scope.email else ''
    password = if $scope.password? then $scope.password else ''
    remember = if $scope.remember? then $scope.remember else false

    alert "LoginCtrl.submit(\"#{email}\", \"#{password}\", \"#{remember.toString()}\")"

TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''