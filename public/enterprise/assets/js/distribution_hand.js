var app=angular.module("dis_handApp",[]);
app.controller("dis_handCtr",["$scope","$http",function($scope,$http){
	$http.get("api/orders").success(function(data){
		console.log(data);
		$scope.dis_hand_list=data;
	})
}])