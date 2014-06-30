(angular.module 'reitz')
.controller 'materialControlController',($scope,$route,$location,$rootScope,projectservice,ReitzResources,chartService)->
    $scope.data = projectservice.data

    $scope.$watch 'data.MaterialDriveControls.MechanicalDesignTemperature > 350',( (value)->
      if value then $scope.data.MaterialDriveControls.StandardImpellerMaterial = false else $scope.data.MaterialDriveControls.StandardImpellerMaterial = true
    ),true
    $scope.$watch 'data.MaterialDriveControls.Drive ',( (value)->
      if value is "K"
        $scope.data.MaterialDriveControls.direct = true
        $scope.data.MaterialDriveControls.IECStandardMotor = false
      else
        $scope.data.MaterialDriveControls.direct = false
        $scope.data.MaterialDriveControls.IECStandardMotor = true
    ),true
    $scope.$watch 'data.MaterialDriveControls.Control ',( (value)->
      if value is "1"
        $scope.data.MaterialDriveControls.IVCPosition = true
      else
        $scope.data.MaterialDriveControls.IVCPosition = false
    ), true

    $scope.fanAssembling = () ->
      $location.path '/fanAssembling'

    $scope.noiseData = () ->
      $location.path '/noiseData'