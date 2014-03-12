(angular.module 'reitz')
.controller 'CustomerLoginController',($scope,$location,$http)->

    $scope.customerViews = ->
      console.log 'coustomer login',$scope
      $location.path '/customerhome'