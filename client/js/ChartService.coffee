(angular.module 'reitz')
.factory 'chartService',()->
    chartData = []
    loading = false
    postdata = {}
    colors = [
      {series:11,name:'2.5 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:'2.5 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:'3 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:'3 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:'3 - 2.5 - 2.5',factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"5 - 3	- 3",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"5 -3	- 3",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"5 - 3 - 3",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"6 - 5 - 5",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"6 - 5 - 5",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"6 - 5 - 3",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"8 - 5 - 5",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"10 - 6 - 6",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"10 - 6 - 6",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"10 - 6 - 6",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"12 - 8 - 8",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"12 - 8 - 8",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"12 - 8 - 8",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"16 - 10 - 10",factor:'6.02-1-4.20',hub:2.50 },
      {series:11,name:"20 - 12 - 10",factor:'6.02-1-4.20',hub:2.50 },

      {series:14,name:'2.5 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'2.5 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'2.5 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'3 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'3 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'3 - 2.5 - 2.5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'5 - 3 - 3',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'5 - 3 - 3',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'5 - 3 - 3',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'6 - 5 - 5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'6 - 5 - 5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'6 - 5 - 5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'8 - 5 - 5',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'10 - 6 - 6',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'12 - 8 - 8',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'12 - 8 - 8',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'12 - 8 - 8',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'16 - 10 - 10',factor:'6.02 - 5.20 - 5.20',hub:2.40 },
      {series:14,name:'20 - 12 - 10',factor:'6.02 - 5.20 - 5.20',hub:2.40 },

      {series:18,name:'2.5	- 2.5	- 2.5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'2.5	- 2.5	- 2.5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'3 - 2.5	- 2.5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'3 - 2.5 - 2.5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'3 - 2.5 - 2.5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'5 - 3 - 3',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'5 - 3 - 3',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'5 - 3 - 3',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'6 - 5 - 5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'6 - 5 - 5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'6 - 5 - 5',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'10 - 6 - 6',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'10 - 6 - 6',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'12 - 8 - 8',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'12 - 8 - 8',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'12 - 8 - 8',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'16	- 10	- 10',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'20	- 12 - 10',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'20	- 12 -	10',factor:'6.25 - 5.53 - 4.25',hub:2.22 },
      {series:18,name:'20	- 12 - 12',factor:'6.25 - 5.53 - 4.25',hub:2.22 },

      {series:22,name:'12 - 8 - 8',factor:'6.23 - 5.78 - 2.67',hub:2.60 },
      {series:22,name:'12 - 8 - 8',factor:'6.23 - 5.78 - 2.67',hub:2.60 },
      {series:22,name:'16 - 10 - 10',factor:'6.23 -	5.78 - 2.67',hub:2.60 },
      {series:22,name:'20 - 12 - 10',factor:'6.23 -	5.78 - 2.67',hub:2.60 },
      {series:22,name:'20 - 12 - 10',factor:'6.23 -	5.78 - 2.67',hub:2.60 },
      {series:22,name:'20 - 12 - 12',factor:'6.23 - 5.78 - 2.67',hub:2.60 },

      {series:28,name:'12 - 8 - 8',factor:'6.50 - 6.00 -2.50',hub:1.75 },
      {series:28,name:'12 - 8 - 8',factor:'6.50 - 6.00 -2.50',hub:1.75 },
      {series:28,name:'16 - 10 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75 },
      {series:28,name:'20 - 12 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75 },
      {series:28,name:'20 - 12 - 10',factor:'6.50 - 6.00 -2.50',hub:1.75 },
      {series:28,name:'20 - 12 - 12',factor:'6.50 - 6.00 -2.50',hub:1.75 }
    ]
    return {
      chartData:chartData
      loading:loading
      postdata:postdata
      colors:colors
    }