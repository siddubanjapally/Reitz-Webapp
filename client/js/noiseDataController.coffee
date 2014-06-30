(angular.module 'reitz')
.controller 'noiseDataController',($scope,$route,$location,$rootScope,projectservice,ReitzResources,chartService)->
    $scope.data = projectservice.data

    $scope.materialControl = () ->
      $location.path '/materialControl'

    $scope.createProject = (data) ->
      $scope.data.GasOperatingPoints.push($scope.data.GasOperatingPoint)
      chartService.postdata = $scope.data
      $scope.data = null
      $location.path '/chartview'
