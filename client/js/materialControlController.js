// Generated by CoffeeScript 1.6.3
(function() {
  (angular.module('reitz')).controller('materialControlController', function($scope, $route, $location, $rootScope, projectservice, ReitzResources, chartService) {
    $scope.data = projectservice.data;
    $scope.$watch('data.MaterialDriveControls.MechanicalDesignTemperature > 350', (function(value) {
      if (value) {
        return $scope.data.MaterialDriveControls.StandardImpellerMaterial = false;
      } else {
        return $scope.data.MaterialDriveControls.StandardImpellerMaterial = true;
      }
    }), true);
    $scope.$watch('data.MaterialDriveControls.Drive ', (function(value) {
      if (value === "K") {
        $scope.data.MaterialDriveControls.direct = true;
        return $scope.data.MaterialDriveControls.IECStandardMotor = false;
      } else {
        $scope.data.MaterialDriveControls.direct = false;
        return $scope.data.MaterialDriveControls.IECStandardMotor = true;
      }
    }), true);
    $scope.$watch('data.MaterialDriveControls.Control ', (function(value) {
      if (value === "1") {
        return $scope.data.MaterialDriveControls.IVCPosition = true;
      } else {
        return $scope.data.MaterialDriveControls.IVCPosition = false;
      }
    }), true);
    $scope.fanAssembling = function() {
      return $location.path('/fanAssembling');
    };
    return $scope.noiseData = function() {
      return $location.path('/noiseData');
    };
  });

}).call(this);

/*
//@ sourceMappingURL=materialControlController.map
*/
