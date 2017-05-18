var app=angular.module("sortApp",[]);
app.controller("sortCtr",["$scope","$http",function($scope,$http){
	$http.get("www.tchautchau.cn/api/categories").success(function(data){
		console.log(data);
		$scope.sort_list=data;
	})
}])