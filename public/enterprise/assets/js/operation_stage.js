var app=angular.module("stageApp",[]);
app.controller("stageCtr",["$scope","$http",function($scope,$http){
	$http.get("www.tchautchau.cn/api/stations").success(function(data){
		console.log(data);
		$scope.stage_list=data;
	})
}])