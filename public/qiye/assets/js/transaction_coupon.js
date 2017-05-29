var app=angular.module("couponApp",[]);
app.controller("couponCtr",["$scope","$http",function($scope,$http){
	var all_url="http://www.tchautchau.cn";
	/*显示所有信息*/
	$scope.show_list=function(){
		$http.get(all_url+"/api/coupons").success(function(data){
			console.log(data)
			$scope.coupon_list=data;
		});
	}
	$scope.show_list();
	/*显示类型*/
	$scope.show_model=function(){
		$(".model-show").show();
		$(".change_save").hide();
		$(".save").show();
	}
	$(".model-show-edit").hide();
	/*隐藏*/
	$scope.hide_model=function(){
		$(".model-show").hide();
		$(".model-show-edit").hide();
		$scope.category_name='';
		$scope.category_status='';
		$scope.category_city='';
	}
	/*添加*/
	$scope.add_coupon=function(){
		$http({
			method:'POST',			
			url:all_url+"/api/coupons",
			data:$.param({
				coupon_name:$scope.coupon_name,
				price:$scope.price
				
			}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"} 
		}).success(function(data){
			$(".model-show").hide();
			$scope.show_list();
		}).error(function(){
			console.log("错误");
		})
	}
	/*显示某个品类*/
	$scope.edit_coupon=function(id){

		$http({
			method:'GET',
			url:all_url+"/api/coupons/"+id,
		}).success(function(data){
			
			$(".model-show").show();
			$(".change_save").show();
			$(".save").hide();
			$scope.coupon_name=data.coupon_name;
			$scope.price=data.price;
			
		})
		$scope.change_coupon=function(){
			$http({
				method:'POST',			
				url:all_url+"/api/update/coupons/"+id,
				data:$.param({					
					coupon_name:$scope.coupon_name,
					price:$scope.price
				}),
				headers:{"Content-Type":"application/x-www-form-urlencoded"} 
			}).success(function(data){
				$(".model-show").hide();
				$scope.show_list();
			}).error(function(){
				console.log("错误");
			})
		}
	}
	$scope.delete_coupon=function(e){
		coupons_id=$(e.target).attr("coupons_id");
		console.log(coupons_id)
		$http({
			method:'POST',
			url:all_url+'/api/delete/coupons/'+coupons_id,
			data:$.param({}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			coupons_id=0;
			$scope.show_list();
		}).error(function(){})
	}
}])