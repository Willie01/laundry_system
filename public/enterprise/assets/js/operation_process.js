var app=angular.module("app_process",[]);
app.controller("processCtr",["$scope","$http",function($scope,$http){
	$scope.show_list=function(){
		$http({
			method:'GET',
			url:"www.tchautchau.cn/api/factories",
		}).success(function(data){
			$(".model-show").show();
			$scope.process_list=data;
		}).error(function(){})		
	}
	$scope.show_list();
	var process_id=0;
	$scope.modify_processInfo=function(e){					/*查看并编辑某个工厂*/
			process_id=$(e.target).attr("process_id");
			$(".model-show").show();
			$(".add-submit").hide();
			$(".change-submit").show();
			$http({
				method:'GET',
				url:"www.tchautchau.cn/api/couriers/"+process_id,
			}).success(function(data){
				$(".factory_name").val(data.name);
				$(".factory_mobile").val(data.phone);
				$(".factory_address").val(data.address);
				$(".factory_pwd").val(data.password);
		
			}).error(function(){})
		}
	$scope.change_factory=function(){			/*提交编辑后的信息*/
		$http({
			method:'POST',
			url:'www.tchautchau.cn/api/update/factories/'+process_id,
			data:$.param({
				name:$(".factory_name").val(),
				phone:$(".factory_mobile").val(),
				address:$(".factory_address").val(),
				password:$(".factory_pwd").val()
			}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			$(".model-show").hide();
			process_id=0;
			$scope.show_list();
		}).error(function(){})
	}
	$scope.delete_factory=function(e){
		process_id=$(e.target).attr("process_id");
		$http({
			method:'POST',
			url:'www.tchautchau.cn/api/delete/factories/'+process_id,
			data:$.param({}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			process_id=0;
			$scope.show_list();
		}).error(function(){})
	}
	$scope.hide_model=function(){
		$(".model-show").hide();
	};
	$scope.add_factory=function(){
		$(".model-show").show();
		$(".about-process-body").find("input").val("");
		$(".add-submit").show();
		$(".change-submit").hide();
	}
	$scope.submit_factory=function(){
		$http({
			method:'POST',
			url:'www.tchautchau.cn/api/factories',
			data:$.param({
				name:$(".factory_name").val(),
				phone:$(".factory_mobile").val(),
				address:$(".factory_address").val(),
				password:$(".factory_pwd").val()
			}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			process_id=0;
			$scope.show_list();
		}).error(function(){})
	}
}])