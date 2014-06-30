(angular.module 'reitz')
.controller 'CustomerLoginController',($scope,$rootScope,$location,$http, userService)->
    $rootScope.admin = false
    $rootScope.login = false
    $scope.customerViews = (login)->
      console.log login
      if login.admin && login.username is userService.user_admin.username && login.password is userService.user_admin.password
          console.log 'admin success'
          $rootScope.admin = true
          $rootScope.login = true
          $location.path '/home'
      else _.filter userService.user_employer, (user)-> if user.username is login.username && user.password is login.password
        console.log 'employee success'
        $location.path '/home'
        $rootScope.login = true
      else
        $scope.userlogin = ''
