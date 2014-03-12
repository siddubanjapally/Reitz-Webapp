(angular.module 'reitz')
.controller 'HomeController',($scope,$location)->
    $scope.customerViews = ->
      $location.url '/projectdata'