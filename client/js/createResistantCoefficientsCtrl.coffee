(angular.module 'reitz')
.controller 'createResistantCoefficientsCtrl', ($scope,ReitzResources) ->
    console.log 'lajfhkugi'
    $scope.FanAssemblies=[
      { label: 'Inlet Sound Silencer', value: 0, pId: 10 },
      { label: 'Inlet Box', value: 1 , pId: 11},
      { label: 'Other Inlet parts', value: 2 , pId: 12},
      { label: 'Outlet Silencer', value: 3 , pId: 13},
      { label: 'Other Outlet Parts', value: 4 , pId: 14}
    ];
    $scope.getFanAssembliesName = $scope.FanAssemblies[0]

    $scope.addCofficients = (val, ob) ->
      console.log 'from adding cofficients :' + val + ob.pId
      data = {
        'Name': ob.label,
        'DisplayText':val,
        'Value':val,
        'ParentId':ob.pId,
        'Type':1,
        'ParentDetails': null
      }
      console.log data
      ReitzResources.multiunitsdata.create(data)
#      console.log $scope.ReitzResources.multiunitsdata.query

