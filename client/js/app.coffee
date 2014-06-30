(angular.module 'reitz',['ngRoute','ngResource','ngTable','ui.bootstrap']) #,'angularCharts'
.config ($routeProvider,$locationProvider,$httpProvider) ->
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    $routeProvider
    .when('/login',{
        templateUrl: '/customer/customerlogin',
        controller: 'CustomerLoginController'})
    .when('/home',{
        templateUrl: '/customer/customerhome',
        controller: 'CustomerHomeController'})
    .when('/newproject',{
        templateUrl: '/customer/Project_Data',
        controller: 'ProjectDataController'})

    .when('/operatingPoint',{
          templateUrl: '/customer/operatingpoints',
          controller: 'OperatingPointsController'})
    .when('/fanAssembling',{
          templateUrl: '/customer/Fan_Assembling',
          controller: 'fanAssemblingController'})
    .when('/materialControl',{
          templateUrl: '/customer/Material_Control',
          controller: 'materialControlController'})
    .when('/noiseData',{
          templateUrl: '/customer/Noises_Data',
          controller: 'noiseDataController'})

    .when '/createResistantCoefficient',
        templateUrl: '/customer/createResistantCoefficients',
        controller: 'createResistantCoefficientsCtrl'

    .when('/projectslist',{
          templateUrl: '/customer/projectslist',
          controller: 'CustomerProjectsListController'})
    .when '/chartview',
        templateUrl: '/customer/resultview'
        controller: 'chartCtrl'
    .when '/createuser',
        templateUrl:'/customer/createUser'
        controller:'createUserCtrl'
    .otherwise redirectTo: '/login'
    $locationProvider.html5Mode true
    $locationProvider.hashPrefix('!')

