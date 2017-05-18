var App=angular.module("App_delivery",[]);
App.controller("deliveryCtr",["$scope","$http",function($scope,$http){
	$scope.show_list=function(){
		$http({
			method:'GET',
			url:"www.tchautchau.cn/api/couriers",
		}).success(function(data){
			console.log(data);
			
				$scope.runners_list=data;

			// }else{
				// alert("ERROR")
			// }
		}).error(function(){})

	}
	$scope.show_list();
	

	$scope.show_deliveryInfo=function(e){
			var delivery_id=$(e.target).attr("delivery_id");
			$http({
				method:'GET',
				url:"www.tchautchau.cn/api/couriers/"+delivery_id,
			}).success(function(data){				
				$(".model-show").show();
				$(".delivery_name").val(data.name);
				$(".delivery_mobile").val(data.telphone);
				$scope.status=data.status;										
			}).error(function(){})
		}

	$scope.modify_deliveryInfo=function(e){
			var delivery_id=$(e.target).attr("delivery_id");
			$http({
				method:'GET',
				url:"www.tchautchau.cn/api/couriers/"+delivery_id,
			}).success(function(data){
		//		if(data.errcode==0){
					console.log(data)
		//		}else{
		//			alert("ERROR")
		//		}
			}).error(function(){})
		}

	$scope.modify_deliveryPwd=function(e){
			var delivery_id=$(e.target).attr("delivery_id");
			$http({
				method:'GET',
				url:"www.tchautchau.cn/api/couriers/"+delivery_id,
			}).success(function(data){
		
			}).error(function(){})
		}


	$scope.hide_model=function(){
		console.log(1)
		$(".model-show").hide();
	};

	
}])

