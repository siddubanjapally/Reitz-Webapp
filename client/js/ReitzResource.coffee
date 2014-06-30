(angular.module 'reitz')
.factory 'ReitzResources',($resource)->
    fanproject : $resource('http://202.153.45.8/ReitzService/api/FanProject/',{},{
      query:{method:'GET',isArray:true}
      create:{method:'POST'}
    })
    fanseries:$resource 'http://202.153.45.8/ReitzService/api/FanSeries/:id',{},{
      query:{method:'GET'}
    }
    multiunitsdata: $resource 'http://202.153.45.8/ReitzService/api/MultiDisplayControlData/',{},{
      query:{method:'GET'}
      create:{method:'POST'}
    }
    fanresultpost: $resource 'http://sikkimgazettes.technoidentity.com/api/Values',{},{
      query:{method:'GET',isArray:true}
      create:{method:'POST',isArray:true}
    }