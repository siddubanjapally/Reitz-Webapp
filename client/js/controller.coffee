(angular.module 'reitz')
.controller('chartCtrl',($scope,ngTableParams,$filter,$http,projectservice,chartService)->
    #data = [{"Series":22,"BladeAngle":55,"NominalSize":2240,"OperatingPoint":1,"Efficiency":53.78,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":675.57,"MotorPower":0,"TotalPressureDifference":20178.02,"FanShaftPower":4947.67,"BackPlate":1568.5026784000001,"ShroudPlate":873.12476544,"Blades":403.32926016,"Hub":654.591808,"Total":3499.5485120000003,"ShaftPowerWithDustLoad":494.93,"GDpow2":10068.73,"RecommendedMotorPower":549.92,"DynamicPressureAtInlet":18.63,"DynamicPressureAtOutlet":36.19,"DynamicPressureEvaseOutlet":18.47,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":125.5,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":655.3,"SpeedAtHighestGuaranteePoint":695.83,"BladePassageFrequency1_111":101.33,"BladePassageFrequency1_111_2":202.67,"BladePassageFrequency1_111_3":304,"Nomenclature":26,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":135.55,"UsableTotalPressureDifference":20092.45},{"Series":22,"BladeAngle":80,"NominalSize":2240,"OperatingPoint":1,"Efficiency":54.98,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":661.22,"MotorPower":0,"TotalPressureDifference":20178.02,"FanShaftPower":4839.71,"BackPlate":1568.5026784000001,"ShroudPlate":873.12476544,"Blades":403.32926016,"Hub":654.591808,"Total":3499.5485120000003,"ShaftPowerWithDustLoad":484.13,"GDpow2":10068.73,"RecommendedMotorPower":537.92,"DynamicPressureAtInlet":18.63,"DynamicPressureAtOutlet":36.19,"DynamicPressureEvaseOutlet":18.47,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":122.83,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":641.39,"SpeedAtHighestGuaranteePoint":681.06,"BladePassageFrequency1_111":132.24,"BladePassageFrequency1_111_2":264.49,"BladePassageFrequency1_111_3":396.73,"Nomenclature":27,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":135.55,"UsableTotalPressureDifference":20092.45},{"Series":22,"BladeAngle":40,"NominalSize":2240,"OperatingPoint":1,"Efficiency":52.36,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":682.88,"MotorPower":0,"TotalPressureDifference":20178.02,"FanShaftPower":5082.63,"BackPlate":1568.5026784000001,"ShroudPlate":873.12476544,"Blades":403.32926016,"Hub":654.591808,"Total":3499.5485120000003,"ShaftPowerWithDustLoad":508.43,"GDpow2":10068.73,"RecommendedMotorPower":546.7,"DynamicPressureAtInlet":18.63,"DynamicPressureAtOutlet":36.19,"DynamicPressureEvaseOutlet":18.47,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":126.86,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":662.39,"SpeedAtHighestGuaranteePoint":703.37,"BladePassageFrequency1_111":79.67,"BladePassageFrequency1_111_2":159.34,"BladePassageFrequency1_111_3":239.01,"Nomenclature":25,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":135.55,"UsableTotalPressureDifference":20092.45},{"Series":28,"BladeAngle":40,"NominalSize":2240,"OperatingPoint":1,"Efficiency":62.18,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":703.84,"MotorPower":0,"TotalPressureDifference":321723.36,"FanShaftPower":4302335.24,"BackPlate":1636.47952,"ShroudPlate":906.3578880000001,"Blades":377.64912,"Hub":440.59064,"Total":3361.077168,"ShaftPowerWithDustLoad":430.8,"GDpow2":6234.11,"RecommendedMotorPower":478.67,"DynamicPressureAtInlet":46.8,"DynamicPressureAtOutlet":90.91,"DynamicPressureEvaseOutlet":46.38,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0.01,"TipSpeed":130.75,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":682.72,"SpeedAtHighestGuaranteePoint":724.95,"BladePassageFrequency1_111":70.38,"BladePassageFrequency1_111_2":140.77,"BladePassageFrequency1_111_3":211.15,"Nomenclature":28,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":8547.73,"UsableTotalPressureDifference":318318.15},{"Series":28,"BladeAngle":75,"NominalSize":2240,"OperatingPoint":1,"Efficiency":59.05,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":669.86,"MotorPower":0,"TotalPressureDifference":321723.36,"FanShaftPower":4529735.83,"BackPlate":1636.47952,"ShroudPlate":906.3578880000001,"Blades":377.64912,"Hub":440.59064,"Total":3361.077168,"ShaftPowerWithDustLoad":453.57,"GDpow2":6234.11,"RecommendedMotorPower":503.96,"DynamicPressureAtInlet":46.8,"DynamicPressureAtOutlet":90.91,"DynamicPressureEvaseOutlet":46.38,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0.01,"TipSpeed":124.44,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":649.77,"SpeedAtHighestGuaranteePoint":689.96,"BladePassageFrequency1_111":122.81,"BladePassageFrequency1_111_2":245.62,"BladePassageFrequency1_111_3":368.42,"Nomenclature":30,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":8547.73,"UsableTotalPressureDifference":318318.15},{"Series":28,"BladeAngle":60,"NominalSize":2240,"OperatingPoint":1,"Efficiency":60.19,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":662.93,"MotorPower":0,"TotalPressureDifference":321723.36,"FanShaftPower":4444548,"BackPlate":1636.47952,"ShroudPlate":906.3578880000001,"Blades":377.64912,"Hub":440.59064,"Total":3361.077168,"ShaftPowerWithDustLoad":445.04,"GDpow2":6234.11,"RecommendedMotorPower":494.49,"DynamicPressureAtInlet":46.8,"DynamicPressureAtOutlet":90.91,"DynamicPressureEvaseOutlet":46.38,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0.01,"TipSpeed":123.15,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":643.04,"SpeedAtHighestGuaranteePoint":682.82,"BladePassageFrequency1_111":99.44,"BladePassageFrequency1_111_2":198.88,"BladePassageFrequency1_111_3":298.32,"Nomenclature":29,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":8547.73,"UsableTotalPressureDifference":318318.15},{"Series":14,"BladeAngle":20,"NominalSize":2500,"OperatingPoint":1,"Efficiency":38.82,"OuterBladeDiameter":2818,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":918.79,"MotorPower":0,"TotalPressureDifference":12702.16,"FanShaftPower":2162.86,"BackPlate":956.1113296,"ShroudPlate":495.5261376000001,"Blades":412.938448,"Hub":381.17395200000004,"Total":2245.7498672,"ShaftPowerWithDustLoad":684.07,"GDpow2":10214.27,"RecommendedMotorPower":735.55,"DynamicPressureAtInlet":11.67,"DynamicPressureAtOutlet":14.41,"DynamicPressureEvaseOutlet":7.35,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":135.56,"NominalOuterBladeDiameter":2818,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":891.23,"SpeedAtHighestGuaranteePoint":946.36,"BladePassageFrequency1_111":76.57,"BladePassageFrequency1_111_2":153.13,"BladePassageFrequency1_111_3":229.7,"Nomenclature":17,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":10,"FlowRate":67.94,"UsableTotalPressureDifference":12678.31},{"Series":14,"BladeAngle":80,"NominalSize":2500,"OperatingPoint":1,"Efficiency":35.52,"OuterBladeDiameter":2818,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":865.75,"MotorPower":0,"TotalPressureDifference":12702.16,"FanShaftPower":2363.72,"BackPlate":956.1113296,"ShroudPlate":495.5261376000001,"Blades":412.938448,"Hub":381.17395200000004,"Total":2245.7498672,"ShaftPowerWithDustLoad":747.6,"GDpow2":10214.27,"RecommendedMotorPower":803.87,"DynamicPressureAtInlet":11.67,"DynamicPressureAtOutlet":14.41,"DynamicPressureEvaseOutlet":7.35,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":127.74,"NominalOuterBladeDiameter":2818,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":839.78,"SpeedAtHighestGuaranteePoint":891.73,"BladePassageFrequency1_111":245.3,"BladePassageFrequency1_111_2":490.59,"BladePassageFrequency1_111_3":735.89,"Nomenclature":21,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":10,"FlowRate":67.94,"UsableTotalPressureDifference":12678.31},{"Series":22,"BladeAngle":55,"NominalSize":2500,"OperatingPoint":1,"Efficiency":53.78,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":675.57,"MotorPower":0,"TotalPressureDifference":50678.22,"FanShaftPower":49460.45,"BackPlate":1568.5026784000001,"ShroudPlate":873.12476544,"Blades":403.32926016,"Hub":654.591808,"Total":3499.5485120000003,"ShaftPowerWithDustLoad":494.93,"GDpow2":10068.73,"RecommendedMotorPower":549.92,"DynamicPressureAtInlet":18.63,"DynamicPressureAtOutlet":36.19,"DynamicPressureEvaseOutlet":18.47,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":125.5,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":655.3,"SpeedAtHighestGuaranteePoint":695.83,"BladePassageFrequency1_111":101.33,"BladePassageFrequency1_111_2":202.67,"BladePassageFrequency1_111_3":304,"Nomenclature":26,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":539.54,"UsableTotalPressureDifference":50463.31},{"Series":22,"BladeAngle":80,"NominalSize":2500,"OperatingPoint":1,"Efficiency":54.98,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":661.22,"MotorPower":0,"TotalPressureDifference":50678.22,"FanShaftPower":48381.16,"BackPlate":1568.5026784000001,"ShroudPlate":873.12476544,"Blades":403.32926016,"Hub":654.591808,"Total":3499.5485120000003,"ShaftPowerWithDustLoad":484.13,"GDpow2":10068.73,"RecommendedMotorPower":537.92,"DynamicPressureAtInlet":18.63,"DynamicPressureAtOutlet":36.19,"DynamicPressureEvaseOutlet":18.47,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":122.83,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":641.39,"SpeedAtHighestGuaranteePoint":681.06,"BladePassageFrequency1_111":132.24,"BladePassageFrequency1_111_2":264.49,"BladePassageFrequency1_111_3":396.73,"Nomenclature":27,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":539.54,"UsableTotalPressureDifference":50463.31},{"Series":22,"BladeAngle":40,"NominalSize":2500,"OperatingPoint":1,"Efficiency":52.36,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":682.88,"MotorPower":0,"TotalPressureDifference":50678.22,"FanShaftPower":50809.56,"BackPlate":1568.5026784000001,"ShroudPlate":873.12476544,"Blades":403.32926016,"Hub":654.591808,"Total":3499.5485120000003,"ShaftPowerWithDustLoad":508.43,"GDpow2":10068.73,"RecommendedMotorPower":546.7,"DynamicPressureAtInlet":18.63,"DynamicPressureAtOutlet":36.19,"DynamicPressureEvaseOutlet":18.47,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0,"TipSpeed":126.86,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":662.39,"SpeedAtHighestGuaranteePoint":703.37,"BladePassageFrequency1_111":79.67,"BladePassageFrequency1_111_2":159.34,"BladePassageFrequency1_111_3":239.01,"Nomenclature":25,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":539.54,"UsableTotalPressureDifference":50463.31},{"Series":28,"BladeAngle":40,"NominalSize":2500,"OperatingPoint":1,"Efficiency":62.18,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":703.84,"MotorPower":0,"TotalPressureDifference":12801298.4,"FanShaftPower":42966779374.34,"BackPlate":1636.47952,"ShroudPlate":906.3578880000001,"Blades":377.64912,"Hub":440.59064,"Total":3361.077168,"ShaftPowerWithDustLoad":430.8,"GDpow2":6234.11,"RecommendedMotorPower":478.67,"DynamicPressureAtInlet":46.8,"DynamicPressureAtOutlet":90.91,"DynamicPressureEvaseOutlet":46.38,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0.01,"TipSpeed":130.75,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":682.72,"SpeedAtHighestGuaranteePoint":724.95,"BladePassageFrequency1_111":70.38,"BladePassageFrequency1_111_2":140.77,"BladePassageFrequency1_111_3":211.15,"Nomenclature":28,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":2145398.15,"UsableTotalPressureDifference":12665805.94},{"Series":28,"BladeAngle":75,"NominalSize":2500,"OperatingPoint":1,"Efficiency":59.05,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":669.86,"MotorPower":0,"TotalPressureDifference":12801298.4,"FanShaftPower":45237795080.82,"BackPlate":1636.47952,"ShroudPlate":906.3578880000001,"Blades":377.64912,"Hub":440.59064,"Total":3361.077168,"ShaftPowerWithDustLoad":453.57,"GDpow2":6234.11,"RecommendedMotorPower":503.96,"DynamicPressureAtInlet":46.8,"DynamicPressureAtOutlet":90.91,"DynamicPressureEvaseOutlet":46.38,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0.01,"TipSpeed":124.44,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":649.77,"SpeedAtHighestGuaranteePoint":689.96,"BladePassageFrequency1_111":122.81,"BladePassageFrequency1_111_2":245.62,"BladePassageFrequency1_111_3":368.42,"Nomenclature":30,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":2145398.15,"UsableTotalPressureDifference":12665805.94},{"Series":28,"BladeAngle":60,"NominalSize":2500,"OperatingPoint":1,"Efficiency":60.19,"OuterBladeDiameter":3548,"NumberOfBladeCuts":0,"NumberOfBladeExtensions":0,"FanSpeed":662.93,"MotorPower":0,"TotalPressureDifference":12801298.4,"FanShaftPower":44387036891.26,"BackPlate":1636.47952,"ShroudPlate":906.3578880000001,"Blades":377.64912,"Hub":440.59064,"Total":3361.077168,"ShaftPowerWithDustLoad":445.04,"GDpow2":6234.11,"RecommendedMotorPower":494.49,"DynamicPressureAtInlet":46.8,"DynamicPressureAtOutlet":90.91,"DynamicPressureEvaseOutlet":46.38,"KinematicViscocity":0.00003252858958068615,"DampeningValue":0.01,"TipSpeed":123.15,"NominalOuterBladeDiameter":3548,"MotorSpeed":0,"SpeedAtLowestGuaranteePoint":643.04,"SpeedAtHighestGuaranteePoint":682.82,"BladePassageFrequency1_111":99.44,"BladePassageFrequency1_111_2":198.88,"BladePassageFrequency1_111_3":298.32,"Nomenclature":29,"StandardBackPlate":20,"StandardShroud":12,"StandardBlade":12,"FlowRate":2145398.15,"UsableTotalPressureDifference":12665805.94}]
    $scope.result = []

    $scope.loading = true
    $scope.colors = chartService.colors
    $scope.da= null
    $scope.updated = {
      backPlate:0
      shroudPlate:0
      blades:0
      hub:0
    }
    #$scope.obj = null
    ###$scope.getSeries = (rivent)->
      $scope.obj = rivent###
    $scope.getRow = (data) ->
      console.log data
      $scope.row= data
    $scope.color = $scope.colors[2]
    $scope.changeDia =(data)->
      console.log typeof(data.FanSpeed)
      $scope.row.OuterBladeDiameter = ($scope.row.FanSpeed/data.FanSpeed)*$scope.row.OuterBladeDiameter
    $scope.selectedPlate = (data)->
      console.log $scope.row.OuterBladeDiameter
      selected = data.color.name.split('-')
      factor = data.color.factor.split('-')
      dia = Math.pow $scope.row.OuterBladeDiameter,2
      $scope.updated.backPlate =2*(parseFloat(selected[0]) * parseFloat(factor[0]) * dia)
      $scope.updated.shroudPlate =2*(parseFloat(selected[1]) * parseFloat(factor[1])  * dia)
      $scope.updated.blades =2*(parseFloat(selected[2]) * parseFloat(factor[2])  * dia)
      $scope.updated.hub =2*(parseFloat(selected[0]) * data.color.hub * dia)

    generateChart = (result)->
      series = []
      speed = []
      efficiency = []
      shaftPower = []
      nomenclature=[]
      nominalsize = []
      _.map(_.range(10),(i)->
        series.push result[i].Series
        speed.push result[i].FanSpeed
        efficiency.push result[i].Efficiency
        shaftPower.push result[i].FanShaftPower
        nominalsize.push result[i].NominalSize
        nomenclature.push result[i].Nomenclature
      )
      $scope.renderChart = {
        barChart:
          chart:
            type: 'column',width:550
          title:
            text: 'Ri-vent'
          xAxis:
            categories: series
          series: [{name:"Speed",data: speed},{name:"Efficiency",data:efficiency},{name:"Fan Shaft Power",data:shaftPower}]
          legend:
            enabled: true
        lineChart:
          chart:
            type: "line",width:550
          title:
            text: 'Ri-vent'
          xAxis:
            categories: speed
          yAxis:
            categories: efficiency
          series: [{name:"Nomenclature",data: nomenclature},{name:"Efficiency",data:efficiency}]
          legend:
            enabled: true
      }
    tableData =()->
      $scope.tableParams = new ngTableParams({
        page:1,
        count:10,
        filter: {
          Series: ''
        },
        sorting:{
          Efficiency:'desc'
        }
      },{
        counts:[],
        total:0,
        getData :( ($defer,params)->
          filteredData = if params.filter() then $filter('filter')($scope.result, params.filter()) else $scope.result
          console.log filteredData
          orderedData = if params.sorting() then $filter('orderBy')(filteredData,params.orderBy()) else $scope.result
          params.total(orderedData.length)
          $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()))
        ),
        $scope: $scope
      })
    #console.log JSON.stringify(projectservice.createJson(chartService.postdata))
    #$http.post('/api/postdata', chartService.postdata).success (result) ->
    $http.post('/api/postdata', JSON.stringify(projectservice.createJson(chartService.postdata))).success (result) ->
      if result.length
        result = _.sortBy(result,'Efficiency').reverse()
        $scope.result = result
        tableData()
        generateChart(result)
        $scope.loading = false
      else
      $scope.loading = false
)
.directive('highchart',()->
  return {
  restrict :'E',
  template:'<div></div>',
  render:true,
  link:(scope,element,attr)->
    scope.$watch (-> attr.chart), ->
      return  unless attr.chart
      charts = JSON.parse(attr.chart)
      $(element[0]).highcharts charts
  }
)

