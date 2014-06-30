(angular.module 'reitz')
.controller 'NewProjectController',($scope,$route,$location,$rootScope,projectservice,ReitzResources,chartService)->
    $scope.inletSilencer = ReitzResources.multiunitsdata.query()
    $scope.mode = 0
    if $rootScope.flag is 0
      $scope.data = {
        Proposal_OrderNo:''
        GasOperatingPoint :
          T: '0'
          P1:'0'
          F:'0'
        FanAssemblies:
          InletSoundSilencer: '0'
          EvaseOutlet_InletAreaRatio: '0'
          InletBox: '0'
          OutletSilencer: '0'
          OutletOtherParts: '0'
          InletOtherParts:'0'
          PressureDifference:'0'
        GasDatas:
          BarometricPressure_Elevation: 0.0
          GasDustload: 0
          VpUnit: '60'
          DptUnit: '10'
          VpUnits : 'M3/S'
          DptUnits: 'PA'
        MaterialDriveControls:
          DesignType: null
          Width: '1'
          BackBlades:false
          StandardImpellerMaterial: true
          IECStandardMotor:false
          NominalMotorSpeed:null
          MotorSpeed:0
          MotorPower:0
          NoiseDataRequired: 0
          MaterialYieldStrength: 0
          IVCPosition:false
          Drive:'K'
          MaterialName: null
          MaterialDensity:''
          direct:true
        Noises:
          Design:0
          FanLocation: 0
          HousingMaterial:null
          RoomAbsorptionArea: '0'
          HousingMetalPlateThickness: '0'
          DistanceBetweenStiffners: null
          BackgroundNoiseCorrection:'0'
        GasOperatingPoints:[]
      }
      console.log projectservice.data
      $scope.opbtn = true
    else
      $scope.data = projectservice.editdata
      $scope.opbtn = true
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

    $scope.$watch 'data.GasOperatingPoint.T',( (value)->
      $scope.data.GasOperatingPoint.Vi = projectservice.density(value)
#      console.log projectservice.data
#      console.log $scope.data
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

    #    $scope.getInlt = () ->
    #      console.log $scope.inletSilencer.$values
    #      for d in $scope.inletSilencer.$values
    #        if d.ParentId==10
    #          console.log d.Value
    #          $scope.inletSlncr=d

    #      $scope.data = projectservice.editdata
#      $scope.opbtn = true
#    $scope.$watch 'data.MaterialDriveControls.MechanicalDesignTemperature > 350',( (value)->
#      if value then $scope.data.MaterialDriveControls.StandardImpellerMaterial = false else $scope.data.MaterialDriveControls.StandardImpellerMaterial = true
#    ),true
#    $scope.$watch 'data.MaterialDriveControls.Drive ',( (value)->
#      if value is "K"
#        $scope.data.MaterialDriveControls.direct = true
#        $scope.data.MaterialDriveControls.IECStandardMotor = false
#      else
#        $scope.data.MaterialDriveControls.direct = false
#        $scope.data.MaterialDriveControls.IECStandardMotor = true
#    ),true
#
#    $scope.$watch 'data.GasOperatingPoint.T',( (value)->
#      $scope.data.GasOperatingPoint.Vi = projectservice.density(value)
#    ), true
#    $scope.$watch 'data.MaterialDriveControls.Control ',( (value)->
#      if value is "1"
#        $scope.data.MaterialDriveControls.IVCPosition = true
#      else
#        $scope.data.MaterialDriveControls.IVCPosition = false
#    ), true
#    $scope.lines = {
#      faninlet: false,
#      fanoutlet: false,
#      onlyfan:false,
#      onlyinlet:false
#    }
#    $scope.chb ={At:true,Ro:false}
#
#    $scope.$watch 'data.GasOperatingPoint.Atcheck',( (value)->
#      console.log value
#      if value
#        $scope.chb.At = false
#        $scope.chb.Ro = true
#        $scope.data.GasOperatingPoint.Alt = null
#      else
#        $scope.chb.At = true
#        $scope.chb.Ro = false
#        $scope.data.GasOperatingPoint.Ro = null
#    ),true
#    $scope.$watch 'data.FanAssemblies.PressureDifference',( (value)->
#      if value is '1'
#        $scope.lines.fanoutlet = true
#        $scope.lines.faninlet = false
#        $scope.lines.onlyinlet = true
#        $scope.lines.onlyfan = false
#      else if value is '2'
#        $scope.lines.faninlet = true
#        $scope.lines.fanoutlet = false
#        $scope.lines.onlyfan = false
#      else if value is '3'
#        $scope.lines.fanoutlet = true
#        $scope.lines.faninlet = true
#        $scope.lines.onlyfan = true
#      else
#        $scope.lines.fanoutlet = false
#        $scope.lines.faninlet = false
#        $scope.lines.onlyinlet = false
#        $scope.lines.onlyfan = false),true

    $scope.projectInfo = () ->
      $location.path '/newproject'
    $scope.operatingPoint = () ->
      $location.path '/operatingPoint'
    $scope.fanAssembling = () ->
      $location.path '/fanAssembling'
    $scope.materialControl = () ->
      $location.path '/materialControl'
    $scope.noiseData = () ->
      $location.path '/noiseData'

    $scope.createProject = (data) ->
      $scope.data.GasOperatingPoints.push($scope.data.GasOperatingPoint)
      chartService.postdata = $scope.data
      $scope.data = null
      $location.path '/chartview'

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
