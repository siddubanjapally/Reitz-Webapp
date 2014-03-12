(angular.module 'reitz')
.factory 'projectservice',()->
    calculateVp = (condition)->
      switch condition
        when "M3/S" then x = parseFloat(1)
        when "M3/M" then x = parseFloat(60)
        when "M3/H" then x = parseFloat(3600)
        when "NM3/S" then x = parseFloat(1)
        when "NM3/M" then x = parseFloat(60)
        when "NM3/H" then x = parseFloat(3600)
    CalcNormalDensity= (condition)->
      switch condition
        when "PA" then x= parseFloat(1)
        when "MMwg" then  x=  parseFloat( 9.81)
        when "Mbar" then x=  parseFloat(0.01)
        when "Dapa" then  x= parseFloat(10)
    Density = (condition,operate)->
      switch condition
        when "PA" then x= parseInt(operate)
        when "MMwg" then  x=  parseInt(operate) * 9.81
        when "Mbar" then x=  parseInt(operate)/0.01
        when "Dapa" then  x= parseInt(operate)/10
    calculateDensity:(condition,operate,Alt,T)->
      staticPressure = parseFloat(Density(condition,operate))/ 9.81
      baroPres = 760*(Math.E^(-0.000125*parseInt(Alt)))
      1.293*(273/273+parseInt(T))*(baroPres-(0.0737*staticPressure)/760).toFixed(5)
    genrateId = ->
      id = 0
      ()->
         ++id
    data = {
      Proposal_OrderNo:''
      GasOperatingPoints :
        T: '0'
        P1:'0'
        F:'0'
      flowrate:
        Vp : 'M3/S'
        pres: 'PA'
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
      GOPoints:[]

    }
    tempViscObject = [
      {temp:0,visc:17},{temp:30,visc:18.5},{temp:40,visc:19},
      {temp:50,visc:19.5},{temp:60,visc:19.9},{temp:70,visc:20.4},
      {temp:80,visc:20.8},{temp:90,visc:21.3},{temp:100,visc:21.7},
      {temp:110,visc:22.1},{temp:120,visc:22.5},{temp:130,visc:23},
      {temp:140,visc:23.4},{temp:150,visc:23.8},{temp:160,visc:24.2},
      {temp:180,visc:25},{temp:200,visc:25.6},{temp:220,visc:26.4},
      {temp:250,visc:27.6},{temp:280,visc:28.6},{temp:300,visc:29.3},
      {temp:320,visc:30},{temp:330,visc:30.3},{temp:340,visc:30.7},
      {temp:350,visc:31},{temp:360,visc:31.2},{temp:380,visc:32},
      {temp:400,visc:32.6},{temp:420,visc:33.2},{temp:450,visc:34},
      {temp:500,visc:35.5},{temp:550,visc:36.9},{temp:600,visc:38.3},{temp:650,visc:39.6}]
    density = (temp)->
      for i in [0...tempViscObject.length]
        if tempViscObject[i].temp is +temp
          return tempViscObject[i].visc + 'e-6'
        else if(tempViscObject[i].temp < +temp && +temp < tempViscObject[i+1].temp && +temp <= 650)
          return (( tempViscObject[i].visc  + tempViscObject[i+1].visc )/2 )+ 'e-6'
    guid = ->
        CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
        chars = CHARS
        uuid = new Array(36)
        rnd = 0
        r = undefined
        i = 0
        while i < 36
          if i is 8 or i is 13 or i is 18 or i is 23
            uuid[i] = "-"
          else if i is 14
            uuid[i] = "4"
          else
            rnd = 0x2000000 + (Math.random() * 0x1000000) | 0  if rnd <= 0x02
            r = rnd & 0xf
            rnd = rnd >> 4
            uuid[i] = chars[(if (i is 19) then (r & 0x3) | 0x8 else r)]
          i++
        uuid.join ""
    createJson =(data) ->
      id = genrateId()
      obj =
        $id: id().toString()
        Date: data.Date
        Engineer: data.Engineer
        ProjectName: data.ProjectName
        Proposal_OrderNo: data.Proposal_OrderNo
        LastUiFormCompleted: null
        Id: guid()
        FanAssemblies: [
          $id: id().toString()
          Id: guid()
          FanProjectId: guid()
          EvaseOutlet_InletAreaRatio: +data.FanAssemblies.EvaseOutlet_InletAreaRatio
          OutletSilencer: +data.FanAssemblies.OutletSilencer
          OutletOtherParts: +data.FanAssemblies.OutletOtherParts
          InletSoundSilencer: +data.FanAssemblies.InletSoundSilencer
          InletBox: +data.FanAssemblies.InletBox
          InletOtherParts: +data.FanAssemblies.InletOtherParts
          PressureDifference: +data.FanAssemblies.PressureDifference
          FanProject:
            $ref: "1"
          EntityKey:
            $id: id().toString()
            EntitySetName: "FanAssemblies"
            EntityContainerName: "FanalytixEntities"
            EntityKeyValues: [
              Key: "Id"
              Type: "System.Guid"
              Value: guid()
            ]
        ]
        FanTypes: []
        GasDatas: [
          $id: id().toString()
          BarometricPressure_Elevation: +data.GasDatas.BarometricPressure_Elevation
          GasDustload: data.GasDatas.GasDustload
          Id: guid()
          FanProjectId: guid()
          VpUnit: calculateVp(data.GasDatas.VpUnits) #data.GasDatas.VpUnit
          DptUnit: CalcNormalDensity(data.GasDatas.DptUnits) #data.GasDatas.DptUnit
          FanProject:
            $ref: "1"
          EntityKey:
            $id: id().toString()
            EntitySetName: "GasDatas"
            EntityContainerName: "FanalytixEntities"
            EntityKeyValues: [
              Key: "Id"
              Type: "System.Guid"
              Value:guid()
            ]
        ]
        Noises: [
          $id: id().toString()
          RoomAbsorptionArea: +data.Noises.RoomAbsorptionArea
          FanLocation: +data.Noises.FanLocation
          BackgroundNoiseCorrection: +data.Noises.BackgroundNoiseCorrection
          Design: +data.Noises.Design
          HousingMetalPlateThickness: +data.Noises.HousingMetalPlateThickness
          DistanceBetweenStiffners: data.Noises.DistanceBetweenStiffners
          HousingMaterial: data.Noises.HousingMaterial
          Id: guid()
          FanProjectId: guid()
          FanProject:
            $ref: "1"
          EntityKey:
            $id: id().toString()
            EntitySetName: "Noises"
            EntityContainerName: "FanalytixEntities"
            EntityKeyValues: [
              Key: "Id"
              Type: "System.Guid"
              Value: guid()
            ]
        ]
        UnitValueForInputFields: []
        MaterialDriveControls: [
          $id: id().toString()
          InletOutletDuct: +data.MaterialDriveControls.InletOutletDuct
          Width: +data.MaterialDriveControls.Width
          DesignType: data.MaterialDriveControls.DesignType
          BackBlades: data.MaterialDriveControls.BackBlades
          Control: +data.MaterialDriveControls.Control
          IVCPosition: data.MaterialDriveControls.IVCPosition
          MechanicalDesignTemperature: +data.MaterialDriveControls.MechanicalDesignTemperature
          StandardImpellerMaterial: data.MaterialDriveControls.StandardImpellerMaterial
          MaterialName: data.MaterialDriveControls.MaterialName
          MaterialDensity: +data.MaterialDriveControls.MaterialDensity || null
          MaterialYieldStrength: data.MaterialDriveControls.MaterialYieldStrength
          IECStandardMotor: data.MaterialDriveControls.IECStandardMotor || false
          NominalMotorSpeed: data.MaterialDriveControls.NominalMotorSpeed || null
          MotorSpeed: +data.MaterialDriveControls.MotorSpeed || null
          MotorPower: data.MaterialDriveControls.MotorPower
          Id: guid()
          FanProjectId: guid()
          NoiseDataRequired: data.MaterialDriveControls.NoiseDataRequired
          Drive: data.MaterialDriveControls.Drive
          FanProject:
            $ref: "1"

          EntityKey:
            $id: id().toString()
            EntitySetName: "MaterialDriveControls"
            EntityContainerName: "FanalytixEntities"
            EntityKeyValues: [
              Key: "Id"
              Type: "System.Guid"
              Value: guid()
            ]
        ]
        EntityKey:
          $id: id().toString()
          EntitySetName: "FanProjects"
          EntityContainerName: "FanalytixEntities"
          EntityKeyValues: [
            Key: "Id"
            Type: "System.Guid"
            Value: guid()
          ]
      obj.GasDatas[0].GasOperatingPoints = []
      _.map _.range(data.GOPoints.length),(i) ->
        obj.GasDatas[0].GasOperatingPoints.push
          $id: id().toString()
          T: +data.GOPoints[i].T
          Dpt: +data.GOPoints[i].Dpt
          P1: +data.GOPoints[i].P1 || 0
          F: +data.GOPoints[i].F || 0
          Id: guid()
          GasDataId: guid()
          Ro: +data.GOPoints[i].Ro
          Vi: data.GOPoints[i].Vi
          Vp: parseFloat(data.GOPoints[i].Vp)
          GasData:
            $ref: "4"
          EntityKey:
            $id: id().toString()
            EntitySetName: "GasOperatingPoints"
            EntityContainerName: "FanalytixEntities"
            EntityKeyValues: [
              Key: "Id"
              Type: "System.Guid"
              Value: guid()
            ]
      obj
    return {
      data:data
      createJson: createJson
      density:density
    }


