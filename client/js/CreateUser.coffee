(angular.module 'reitz')
.controller 'createUserCtrl', ($scope,$location,$rootScope,$http, userService) ->
    $scope.createUser = ()->
      console.log 'from create user'
      console.log $scope.data
      if $scope.data.username != undefined && $scope.data.password != undefined && $scope.data.confirmPassword != undefined
        #userService.user_employer = $scope.data
        user = {
          id: _.max(userService.user_employer, (user) -> user.id ).id + 1,
          username: $scope.data.username,
          password: $scope.data.password
        }
        userService.user_employer.push user
        console.log 'successfully pushed into the user_employer'

      else
        console.log 'Please fill the details'