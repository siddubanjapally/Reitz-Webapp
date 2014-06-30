(angular.module 'reitz')
.controller 'fanAssemblingController',($scope,$route,$location,$rootScope,projectservice,ReitzResources,chartService)->
    $scope.data = projectservice.data
    $scope.inletSilencer = ReitzResources.multiunitsdata.query()
    $scope.lines = {
      faninlet: false,
      fanoutlet: false,
      onlyfan:false,
      onlyinlet:false
    }
    $scope.$watch 'data.FanAssemblies.PressureDifference',( (value)->
      if value is '1'
        $scope.lines.fanoutlet = true
        $scope.lines.faninlet = false
        $scope.lines.onlyinlet = true
        $scope.lines.onlyfan = false
      else if value is '2'
        $scope.lines.faninlet = true
        $scope.lines.fanoutlet = false
        $scope.lines.onlyfan = false
      else if value is '3'
        $scope.lines.fanoutlet = true
        $scope.lines.faninlet = true
        $scope.lines.onlyfan = true
      else
        $scope.lines.fanoutlet = false
        $scope.lines.faninlet = false
        $scope.lines.onlyinlet = false
        $scope.lines.onlyfan = false),true

    $scope.operatingPoint = () ->
      $location.path '/operatingPoint'

    $scope.materialControl = () ->
      $location.path '/materialControl'
