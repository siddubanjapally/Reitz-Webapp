(angular.module 'reitz')
.controller 'NewProjectController',($scope,$location,projectservice,chartService)->
    $scope.mode = 0
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

    $scope.$watch 'data.GasOperatingPoints.T',( (value)->
      $scope.data.GasOperatingPoints.Vi = projectservice.density(value)
    ), true
    $scope.$watch 'data.MaterialDriveControls.Control ',( (value)->
      if value is "1"
        $scope.data.MaterialDriveControls.IVCPosition = true
      else
        $scope.data.MaterialDriveControls.IVCPosition = false
    ), true
    $scope.lines = {
      faninlet: false,
      fanoutlet: false,
      onlyfan:false,
      onlyinlet:false
    }
    $scope.chb ={At:true,Ro:false}

    $scope.$watch 'data.GasOperatingPoints.Atcheck',( (value)->
      console.log value
      if value
        $scope.chb.At = false
        $scope.chb.Ro = true
        $scope.data.GasOperatingPoints.Alt = null
      else
        $scope.chb.At = true
        $scope.chb.Ro = false
        $scope.data.GasOperatingPoints.Ro = null
    ),true
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

    $scope.createProject = (data) ->
      #data1 = {"$id":"1","Date":"Thu Feb 06 2014 00:00:00 GMT+0530 (India Standard Time)","Engineer":"raj","ProjectName":"Reitz India","Proposal_OrderNo":"10","LastUiFormCompleted":null,"Id":"2ed75ab4-48b1-435f-bb2c-dfc3d968b4e6","FanAssemblies":[{"$id":"2","Id":"ca697236-63b4-40f7-8c52-a52d688119ee","FanProjectId":"c32618c7-e35d-4738-b1cc-342efd4997e9","EvaseOutlet_InletAreaRatio":0,"OutletSilencer":0,"OutletOtherParts":0,"InletSoundSilencer":0,"InletBox":0.3,"InletOtherParts":0.2,"PressureDifference":0,"FanProject":{"$ref":"1"},"EntityKey":{"$id":"3","EntitySetName":"FanAssemblies","EntityContainerName":"FanalytixEntities","EntityKeyValues":[{"Key":"Id","Type":"System.Guid","Value":"21b59324-751a-4bfe-91c1-31ca42311353"}]}}],"FanTypes":[],"GasDatas":[{"$id":"4","BarometricPressure_Elevation":0,"GasDustload":0,"Id":"452cce78-0bd6-4aab-b973-5f91ec54301d","FanProjectId":"5280d014-484f-42cf-9057-74a439b75eaf","VpUnit":"60","DptUnit":"10","FanProject":{"$ref":"1"},"EntityKey":{"$id":"7","EntitySetName":"GasDatas","EntityContainerName":"FanalytixEntities","EntityKeyValues":[{"Key":"Id","Type":"System.Guid","Value":"6321e95e-af4b-4f0d-92e3-1035ecfbd3fb"}]},"GasOperatingPoints":[{"$id":"5","T":100,"Dpt":600,"P1":0,"F":0,"Id":"4242578b-7851-497b-a355-4eef2909fcf1","GasDataId":"914ebf20-69d6-4163-84ab-edf450ee99ec","Ro":0.787,"Vi":"21.7e-6","Vp":1.5278333333,"GasData":{"$ref":"4"},"EntityKey":{"$id":"6","EntitySetName":"GasOperatingPoints","EntityContainerName":"FanalytixEntities","EntityKeyValues":[{"Key":"Id","Type":"System.Guid","Value":"4242578b-7851-497b-a355-4eef2909fcf1"}]}}]}],"Noises":[{"$id":"8","RoomAbsorptionArea":0,"FanLocation":0,"BackgroundNoiseCorrection":0,"Design":0,"HousingMetalPlateThickness":0,"DistanceBetweenStiffners":null,"HousingMaterial":null,"Id":"877cbffb-5c4d-4dcf-9fd8-60657d83ea97","FanProjectId":"4b1c7675-058b-4b35-bed0-a8ce225fc996","FanProject":{"$ref":"1"},"EntityKey":{"$id":"9","EntitySetName":"Noises","EntityContainerName":"FanalytixEntities","EntityKeyValues":[{"Key":"Id","Type":"System.Guid","Value":"8dc084bc-d273-487d-b88d-8e273effeca2"}]}}],"UnitValueForInputFields":[],"MaterialDriveControls":[{"$id":"10","InletOutletDuct":2,"Width":1,"DesignType":null,"BackBlades":false,"Control":2,"IVCPosition":true,"MechanicalDesignTemperature":200,"StandardImpellerMaterial":true,"MaterialName":null,"MaterialDensity":0,"MaterialYieldStrength":null,"IECStandardMotor":false,"NominalMotorSpeed":null,"MotorSpeed":0,"MotorPower":null,"Id":"22980c34-2b92-494b-a60c-68ddd5c6151a","FanProjectId":"e69b3f09-f215-4deb-8678-9e33e663fc00","NoiseDataRequired":null,"Drive":"k","FanProject":{"$ref":"1"},"EntityKey":{"$id":"11","EntitySetName":"MaterialDriveControls","EntityContainerName":"FanalytixEntities","EntityKeyValues":[{"Key":"Id","Type":"System.Guid","Value":"5f1989f0-e281-401d-8a03-53bfe3aa1a1e"}]}}],"EntityKey":{"$id":"12","EntitySetName":"FanProjects","EntityContainerName":"FanalytixEntities","EntityKeyValues":[{"Key":"Id","Type":"System.Guid","Value":"ebcc7c98-466f-4133-a633-e4041ac36cf8"}]}}
      $scope.data.GOPoints.push($scope.data.GasOperatingPoints)
      chartService.postdata = $scope.data
      $location.path '/chartview'
    $scope.addOperatingPoint = ()->
      $scope.data.GOPoints.push($scope.data.GasOperatingPoints)
      $scope.data.GasOperatingPoints = {T:0,P1:0,F:0}
    $scope.calculateDensity =()->
      condition = $scope.data.GasDatas.DptUnits
      operate = $scope.data.GasOperatingPoints.Dpt
      Alt = $scope.data.GasOperatingPoints.Alt
      T = $scope.data.GasOperatingPoints.T
      $scope.data.GasOperatingPoints.Ro = projectservice.calculateDensity(condition,operate,Alt,T)

