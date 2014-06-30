(angular.module 'reitz')
.factory 'userService', ($rootScope) ->
    $rootScope.admin = false
    $rootScope.login = false
    user_admin = {
      admin: 'admin',
      username: 'a',
      password: 'a'
    }
    user_employer =[ {
      employer: 'employer',
      username: 'e',
      password: 'e'
    }]
    return{
      user_admin: user_admin,
      user_employer: user_employer
    }
