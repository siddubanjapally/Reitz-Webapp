// Generated by CoffeeScript 1.6.3
(function() {
  (angular.module('reitz')).controller('CustomerHomeController', function($scope, $rootScope, $location) {
    $scope.gotoNewProject = function() {
      $rootScope.flag = 0;
      return $location.path('/newproject');
    };
    return $scope.gotEditProject = function() {
      console.log('edit');
      $rootScope.flag = 1;
      return $location.path('/projectslist');
    };
  });

}).call(this);

/*
//@ sourceMappingURL=CustomerHomeController.map
*/
