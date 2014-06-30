(angular.module 'reitz')
.controller('chartCtrl',($scope,ngTableParams,$filter,$http,projectservice,chartService)->
    $scope.postdata = chartService.postdata
    console.log chartService.postdata
    $scope.result = []
    $scope.loading = true
    $scope.colors = chartService.colors
    $scope.getRow = (data) ->
      console.log data
      $scope.row= data
    $scope.color = $scope.colors[2]
    $scope.changeDia =(data)->
      $scope.row.OuterBladeDiameter =Math.ceil ($scope.row.FanSpeed/data.FanSpeed)*$scope.row.OuterBladeDiameter
    $scope.selectedPlate = (data)->
      selected = data.color.name.split('-')
      factor = data.color.factor.split('-')
      dia = Math.pow ($scope.row.OuterBladeDiameter/1000),2
      $scope.row.backPlate1 = +$scope.postdata.MaterialDriveControls.Width*(parseFloat(selected[0]) * parseFloat(factor[0]) * dia)
      $scope.row.shroudPlate1= +$scope.postdata.MaterialDriveControls.Width*(parseFloat(selected[1]) * parseFloat(factor[1])  * dia)
      $scope.row.blades1 = +$scope.postdata.MaterialDriveControls.Width*(parseFloat(selected[2]) * parseFloat(factor[2])  * dia)
      $scope.row.hub1 = +$scope.postdata.MaterialDriveControls.Width*(parseFloat(selected[0]) * data.color.hub * dia)

    generateChart = (result)->
      chartData =
        series : []
        speed : []
        efficiency : []
        shaftPower : []
        nomenclature:[]
        nominalsize : []
      _.map(_.range(10),(i)->
        chartData.series.push result[i].Series
        chartData.speed.push result[i].FanSpeed
        chartData.efficiency.push result[i].Efficiency
        chartData.shaftPower.push result[i].FanShaftPower
        chartData.nominalsize.push result[i].NominalSize
        chartData.nomenclature.push result[i].Nomenclature
      )
      $scope.renderChart = {
        barChart:
          chart:
            type: 'column',width:550
          title:
            text: 'Ri-vent'
          xAxis:
            categories: chartData.series
          series: [{name:"Speed",data: chartData.speed},{name:"Efficiency",data:chartData.efficiency},{name:"Fan Shaft Power",data:chartData.shaftPower}]
          legend:
            enabled: true
        lineChart:
          chart:
            type: "line",width:550
          title:
            text: 'Ri-vent'
          xAxis:
            categories: chartData.speed
          yAxis:
            categories: chartData.efficiency
          series: [{name:"Nomenclature",data: chartData.nomenclature},{name:"Efficiency",data:chartData.efficiency}]
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
    #console.log JSON.stringify(projectservice.createJson($scope.postdata))
    #$http.post('/api/postdata', chartService.postdata).success (result) ->
    $http.post('/api/postdata', JSON.stringify(projectservice.createJson($scope.postdata))).success (result) ->
      if result.length
        result = _.sortBy(result,'Efficiency').reverse()
        result = _.map result,(item)->
          _.assign item,{backPlate1 : 0,shroudPlate1 : 0,blades1 : 0,hub1 : 0 }
        $scope.result = result
        projectservice.postdata= null
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
###
.directive('report',()->
    return {
      restrict :'E',
      template:'<div></div>',
      render:true,
      link:(scope,element,attr)->
          $(element[0]).telerik_ReportViewer({
          serviceUrl: "http://192.168.0.160/ReportService/api/reports/"
          templateUrl: "ReportViewer/templates/telerikReportViewerTemplate.html"
          reportSource:
            report: "Farmats.trdx"
          }
        )
    }
  )
###

