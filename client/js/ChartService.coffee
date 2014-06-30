(angular.module 'reitz')
.factory 'chartService',($http,$resource)->
    chartData = []
    serverData = []
    loading = false
    postdata = {}
    editdata= {}
    $http.get('/js/FanSeriesScantillings.json').success (result)->
    colors = [
      {series:11,name:'2.5 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:'3 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:"5 - 3	- 3",factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:"6 - 5 - 5",factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:"8 - 5 - 5",factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:"10 - 6 - 6",factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:"12 - 8 - 8",factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:"16 - 10 - 10",factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:"20 - 12 - 10",factor:'6.02-1-4.20',hub:2.50,dia:1.241},

      {series:14,name:'2.5 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'3 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'5 - 3 - 3',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'6 - 5 - 5',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'8 - 5 - 5',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'10 - 6 - 6',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'12 - 8 - 8',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'16 - 10 - 10',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},
      {series:14,name:'20 - 12 - 10',factor:'6.02 - 5.20 - 5.20',hub:2.40,dia:1.241},

      {series:18,name:'2.5	- 2.5	- 2.5',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'3 - 2.5	- 2.5',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'5 - 3 - 3',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'6 - 5 - 5',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'10 - 6 - 6',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'12 - 8 - 8',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'16	- 10	- 10',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'20	- 12 - 10',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},
      {series:18,name:'20	- 12 - 12',factor:'6.25 - 5.53 - 4.25',hub:2.22,dia:1.241},

      {series:22,name:'2.5 - 2.5- 2.5',factor:'6.23 - 5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'3	- 2.5 - 2.5',factor:'6.23 - 5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'5	- 3	- 3',factor:'6.23 - 5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'6	- 5	- 5',factor:'6.23 - 5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'10	- 6	- 6',factor:'6.23 - 5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'12 - 8 - 8',factor:'6.23 - 5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'16 - 10 - 10',factor:'6.23 -	5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'20 - 12 - 10',factor:'6.23 -	5.78 - 2.67',hub:2.60,dia:1.241},
      {series:22,name:'20 - 12 - 12',factor:'6.23 - 5.78 - 2.67',hub:2.60,dia:1.241},

      {series:28,name:'2.5 - 2.5	- 2.5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'3 - 2.5	- 2.5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'5 - 3	- 3',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'6 - 5	- 5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'10	- 6	- 6',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'12 - 8 - 8',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'16 - 10 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'20 - 12 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:28,name:'20 - 12 - 12',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},

      {series:35,name:'2.5 - 2.5 - 2.5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'3 - 2.5 - 2.5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'5 - 3 - 3',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'6 - 5 - 5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'10 - 6 - 6',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'12 - 8 - 8',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'16 - 10 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'20 - 12 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:35,name:'20 - 12 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},

      {series:45,name:'3 - 2.5 - 2.5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:45,name:'5 - 3 - 3',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:45,name:'6 - 5 - 5',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:45,name:'10 - 6 - 6',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:45,name:'12 - 8 - 8',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:45,name:'16 - 10 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:45,name:'20 - 12 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241},
      {series:45,name:'20 - 12 - 12',factor:'6.50 - 6.00 -2.50',hub:1.75,dia:1.241}
    ]
    return {
    chartData:chartData
    loading:loading
    postdata:postdata
    editdata:editdata
    colors:colors
    serverData:serverData
    }