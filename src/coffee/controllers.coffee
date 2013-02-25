MainCtrl = ($scope) ->

LoginCtrl = ($scope) ->
  $scope.submit = () ->
    email = if $scope.email? then $scope.email else ''
    password = if $scope.password? then $scope.password else ''
    remember = if $scope.remember? then $scope.remember else false

    alert document.cookie

    $.ajax '/api/login',
      type: 'POST'
      cache: false
      dataType: 'json'
      data:
        email: email
        password: password
        remember: remember

      success: (data) ->
        alert JSON.stringify data

    #alert "LoginCtrl.submit(\"#{email}\", \"#{password}\", \"#{remember.toString()}\")"

TestCtrl = ($scope) ->
  $scope.soviets = []

  $scope.addSoviet = () ->
    $scope.soviets.push $scope.sovietText

    $scope.sovietText = ''