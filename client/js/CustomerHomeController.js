// Generated by CoffeeScript 1.6.3
(function() {
  (angular.module('reitz')).controller('CustomerHomeController', function($scope, $window, $location) {
    $scope.gotoNewProject = function() {
      return $window.$location.url('/newproject');
    };
    return $scope.gotEditProject = function() {
      return $location.url('/');
    };
  });

}).call(this);

/*
//@ sourceMappingURL=CustomerHomeController.map
*/