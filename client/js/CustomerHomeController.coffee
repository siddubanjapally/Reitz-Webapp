(angular.module 'reitz')
.controller 'CustomerHomeController',($scope,$window,$location)->
    $scope.gotoNewProject = ->
      $window.$location.url '/newproject'
    $scope.gotEditProject = ->
      $location.url '/'
