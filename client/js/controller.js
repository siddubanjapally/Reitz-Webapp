// Generated by CoffeeScript 1.6.3
(function() {
  (angular.module('reitz')).controller('chartCtrl', function($scope, ngTableParams, $filter, $http, projectservice, chartService) {
    var generateChart, tableData;
    $scope.result = [];
    $scope.loading = true;
    $scope.colors = chartService.colors;
    $scope.da = null;
    $scope.updated = {
      backPlate: 0,
      shroudPlate: 0,
      blades: 0,
      hub: 0
    };
    /*$scope.getSeries = (rivent)->
      $scope.obj = rivent
    */

    $scope.getRow = function(data) {
      console.log(data);
      return $scope.row = data;
    };
    $scope.color = $scope.colors[2];
    $scope.changeDia = function(data) {
      console.log(typeof data.FanSpeed);
      return $scope.row.OuterBladeDiameter = ($scope.row.FanSpeed / data.FanSpeed) * $scope.row.OuterBladeDiameter;
    };
    $scope.selectedPlate = function(data) {
      var dia, factor, selected;
      console.log($scope.row.OuterBladeDiameter);
      selected = data.color.name.split('-');
      factor = data.color.factor.split('-');
      dia = Math.pow($scope.row.OuterBladeDiameter, 2);
      $scope.updated.backPlate = 2 * (parseFloat(selected[0]) * parseFloat(factor[0]) * dia);
      $scope.updated.shroudPlate = 2 * (parseFloat(selected[1]) * parseFloat(factor[1]) * dia);
      $scope.updated.blades = 2 * (parseFloat(selected[2]) * parseFloat(factor[2]) * dia);
      return $scope.updated.hub = 2 * (parseFloat(selected[0]) * data.color.hub * dia);
    };
    generateChart = function(result) {
      var efficiency, nomenclature, nominalsize, series, shaftPower, speed;
      series = [];
      speed = [];
      efficiency = [];
      shaftPower = [];
      nomenclature = [];
      nominalsize = [];
      _.map(_.range(10), function(i) {
        series.push(result[i].Series);
        speed.push(result[i].FanSpeed);
        efficiency.push(result[i].Efficiency);
        shaftPower.push(result[i].FanShaftPower);
        nominalsize.push(result[i].NominalSize);
        return nomenclature.push(result[i].Nomenclature);
      });
      return $scope.renderChart = {
        barChart: {
          chart: {
            type: 'column',
            width: 550
          },
          title: {
            text: 'Ri-vent'
          },
          xAxis: {
            categories: series
          },
          series: [
            {
              name: "Speed",
              data: speed
            }, {
              name: "Efficiency",
              data: efficiency
            }, {
              name: "Fan Shaft Power",
              data: shaftPower
            }
          ],
          legend: {
            enabled: true
          }
        },
        lineChart: {
          chart: {
            type: "line",
            width: 550
          },
          title: {
            text: 'Ri-vent'
          },
          xAxis: {
            categories: speed
          },
          yAxis: {
            categories: efficiency
          },
          series: [
            {
              name: "Nomenclature",
              data: nomenclature
            }, {
              name: "Efficiency",
              data: efficiency
            }
          ],
          legend: {
            enabled: true
          }
        }
      };
    };
    tableData = function() {
      return $scope.tableParams = new ngTableParams({
        page: 1,
        count: 10,
        filter: {
          Series: ''
        },
        sorting: {
          Efficiency: 'desc'
        }
      }, {
        counts: [],
        total: 0,
        getData: (function($defer, params) {
          var filteredData, orderedData;
          filteredData = params.filter() ? $filter('filter')($scope.result, params.filter()) : $scope.result;
          console.log(filteredData);
          orderedData = params.sorting() ? $filter('orderBy')(filteredData, params.orderBy()) : $scope.result;
          params.total(orderedData.length);
          return $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
        }),
        $scope: $scope
      });
    };
    return $http.post('/api/postdata', JSON.stringify(projectservice.createJson(chartService.postdata))).success(function(result) {
      if (result.length) {
        result = _.sortBy(result, 'Efficiency').reverse();
        $scope.result = result;
        tableData();
        generateChart(result);
        $scope.loading = false;
      } else {

      }
      return $scope.loading = false;
    });
  }).directive('highchart', function() {
    return {
      restrict: 'E',
      template: '<div></div>',
      render: true,
      link: function(scope, element, attr) {
        return scope.$watch((function() {
          return attr.chart;
        }), function() {
          var charts;
          if (!attr.chart) {
            return;
          }
          charts = JSON.parse(attr.chart);
          return $(element[0]).highcharts(charts);
        });
      }
    };
  });

}).call(this);

/*
//@ sourceMappingURL=controller.map
*/
