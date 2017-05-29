var App=angular.module("App_delivery",[]);
App.controller("deliveryCtr",["$scope","$http",function($scope,$http){
	var all_url="http://www.tchautchau.cn";
	$scope.show_list=function(){//显示所有骑手信息
		$http({
			method:'GET',
			url:all_url+"/api/couriers",
		}).success(function(data){
			$scope.runners_list=data;
		}).error(function(){})
	}
	$scope.show_list();
	
	$scope.show_deliveryInfo=function(e){//获取某个骑手信息
		var delivery_id=$(e.target).attr("delivery_id");
		$(".save").hide();
		$(".change_save").show();
		$(".model-show").show();
		$http({
			method:'GET',
			url:all_url+"/api/couriers/"+delivery_id,
		}).success(function(data){				
			$(".model-show").show();
			$(".delivery_name").val(data.courier_name);
			$(".delivery_mobile").val(data.telphone);
			$scope.status=data.status;										
		}).error(function(){})
		$scope.modify_deliveryInfo=function(){//提交修改信息
			var delivery_id=$(e.target).attr("delivery_id");
			$http({
				method:'POST',
				url:all_url+"/api/update/couriers/"+delivery_id,
				data:$.param({
					courier_name:$(".delivery_name").val(),
					telphone:$(".delivery_mobile").val(),
					status:$(".delivery_status").val(),
				}),
				headers:{"Content-Type":"application/x-www-form-urlencoded"}
			}).success(function(data){
				$(".model-show").hide();
				$scope.show_list();
			}).error(function(){})
		}
	}


	$scope.delete_delivery=function(id){//删除骑手
		var delivery_id=id;
		$http({
			method:'POST',
			url:all_url+"/api/delete/couriers/"+delivery_id,
			data:$.param({}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			$scope.show_list();
		}).error(function(){})
	}
	$scope.add_deliveryInfo=function(){//添加骑手
		$(".save").show();
		$(".change_save").hide();
		$(".model-show").show();
		$(".delivery_name").val("");
		$(".delivery_mobile").val("");
		$(".delivery_status").find("option:first-of-type").attr("selected",true);
	}
	$scope.submit_delivery=function(){//提交添加骑手信息
		$http({
			method:'POST',
			url:all_url+'/api/couriers',
			data:$.param({
				name:$(".delivery_name").val(),
				phone:$(".delivery_mobile").val(),
				status:$(".delivery_status").val(),
			}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			$scope.hide_model();
			$scope.show_list();
		}).error(function(){})	
	}

	$scope.hide_model=function(){
		$(".model-show").hide();
	};
//	$scope.filter_delivery=function(){
//		console.log($(".filter_delivery").val())
//		$http({
//			method:'GET',
//			url:all_url+"/api/statuses/"+$(".filter_delivery").val()+"/couriers",
//		}).success(function(data){
//			$scope.runners_list=data;
//		}).error(function(){})
//	}
	
}])

