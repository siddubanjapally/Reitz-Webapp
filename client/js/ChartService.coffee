(angular.module 'reitz')
.factory 'chartService',()->
    chartData = []
    loading = false
    postdata = {}
    colors = [
      {series:11,name:'2.5 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:'2.5 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:'3 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:11,name:'3 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:14,name:'5 - 3 - 3',factor:'6.02-5.20-4.20',hub:2.50,dia:1.241},
      {series:14,name:'5 - 3 - 3',factor:'6.02-5.20-4.20',hub:2.50,dia:1.241},
      {series:14,name:'5 - 3 - 3',factor:'6.02-5.20-4.20',hub:2.50,dia:1.241},
      {series:16,name:'5 - 3 - 3',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:16,name:'5 - 3 - 3',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:16,name:'5 - 3 - 3',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
      {series:16,name:'5 - 3 - 3',factor:'6.02-1-4.20',hub:2.50,dia:1.241},
    ]
    return {
      chartData:chartData
      loading:loading
      postdata:postdata
      colors:colors
    }