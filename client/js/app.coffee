(angular.module 'reitz',['ngRoute','ngResource','ngTable','ui.bootstrap']) #,'angularCharts'
.config ($routeProvider,$locationProvider) ->
    $routeProvider
    .when('/',{
        templateUrl: '/customer/customerlogin',
        controller: 'CustomerLoginController'})
    .when('/customerlogin',{
        templateUrl: '/customer/customerlogin',
        controller: 'CustomerLoginController'})
    .when('/customerhome',{
        templateUrl: '/customer/customerhome',
        controller: 'CustomerHomeController'})
    .when('/newproject',{
        templateUrl: '/customer/projectData',
        controller: 'NewProjectController'})
    .when '/chartview',
        templateUrl: '/customer/resultview'
        controller: 'chartCtrl'
    .otherwise redirectTo: '/'
    $locationProvider.html5Mode true
    $locationProvider.hashPrefix('!')
