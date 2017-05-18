var App=angular.module("App_users",[]);
App.controller("usersCtr",["$scope","$http",function($scope,$http){
	$scope.show_list=function(){
		$http({
			method:'GET',
			url:"www.tchautchau.cn/api/user_addresses",
		}).success(function(data){
			console.log(data);
			$scope.runners_list=data;

		}).error(function(){})

	}
	$scope.show_list();
	


	
	
}])













