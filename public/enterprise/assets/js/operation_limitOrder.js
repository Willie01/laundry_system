var app=angular.module("limitApp",[]);
app.controller("limitCtr",["$scope","$http",function($scope,$http){
	$http.get("www.tchautchau.cn/api/order_items").success(function(data){
		console.log(data);
		$scope.limit_list=data;
	})
}])