(angular.module 'reitz')
.controller 'OperatingPointsController',($scope,$route,$location,$rootScope,projectservice,ReitzResources,chartService)->

    $scope.data = projectservice.data
    $scope.opbtn = true
    $scope.$watch 'data.GasOperatingPoint.T',( (value)->
      $scope.data.GasOperatingPoint.Vi = projectservice.density(value)
#      console.log projectservice.data
#      console.log $scope.data
    ), true

    $scope.chb ={At:true,Ro:false}

    $scope.$watch 'data.GasOperatingPoint.Atcheck',( (value)->
#      console.log value
      if value
        $scope.chb.At = false
        $scope.chb.Ro = true
        $scope.data.GasOperatingPoint.Alt = null
      else
        $scope.chb.At = true
        $scope.chb.Ro = false
        $scope.data.GasOperatingPoint.Ro = null
    ),true

    $scope.addOperatingPoint = (dummy)->
      if dummy is undefined
        $scope.data.GasOperatingPoints.push($scope.data.GasOperatingPoint)
        $scope.data.GasOperatingPoint = {T:0,F:0,P1:0}
      else
        $scope.data.GasOperatingPoints[dummy]=$scope.data.GasOperatingPoint
        $scope.data.GasOperatingPoint = {T:0}

    $scope.showGoPoints = (op,index)->
      $scope.opbtn = false
      $scope.indexSet=index
      $scope.data.GasOperatingPoint = op

    $scope.updateGoPoint = () ->
      $scope.opbtn = true
      $scope.addOperatingPoint($scope.indexSet)

    $scope.calculateDensity =()->
      condition = $scope.data.GasDatas.DptUnits
      operate = $scope.data.GasOperatingPoint.Dpt
      Alt = $scope.data.GasOperatingPoint.Alt
      T = $scope.data.GasOperatingPoint.T
      $scope.data.GasOperatingPoint.Ro = projectservice.calculateDensity(condition,operate,Alt,T)

    $scope.projectInfo = () ->
      $location.path '/newproject'

    $scope.fanAssembling = () ->
      $location.path '/fanAssembling'
