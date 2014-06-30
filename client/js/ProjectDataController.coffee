(angular.module 'reitz')
.controller 'ProjectDataController',($scope,$route,$location,$rootScope,projectservice)->
    $scope.data = projectservice.data

    $scope.projectInfo = () ->
      $location.path '/newproject'
    $scope.operatingPoint = () ->
      $location.path '/operatingPoint'



