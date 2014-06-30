(angular.module 'reitz')
.controller 'CustomerHomeController',($scope,$rootScope,$location)->
    $scope.gotoNewProject = ->
      $rootScope.flag= 0
      $location.path '/newproject'
    $scope.gotEditProject = ->
      console.log 'edit'
      $rootScope.flag = 1
      $location.path '/projectslist'
