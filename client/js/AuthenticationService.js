// Generated by CoffeeScript 1.6.3
(function() {
  (angular.module('reitz')).factory('userService', function($rootScope) {
    var user_admin, user_employer;
    $rootScope.admin = false;
    $rootScope.login = false;
    user_admin = {
      admin: 'admin',
      username: 'a',
      password: 'a'
    };
    user_employer = [
      {
        employer: 'employer',
        username: 'e',
        password: 'e'
      }
    ];
    return {
      user_admin: user_admin,
      user_employer: user_employer
    };
  });

}).call(this);

/*
//@ sourceMappingURL=AuthenticationService.map
*/