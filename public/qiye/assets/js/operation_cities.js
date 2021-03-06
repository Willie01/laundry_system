var app=angular.module("cityApp",[]);
app.controller("cityCtr",["$scope","$http",function($scope,$http){
	var all_url="http://www.tchautchau.cn";
	/*显示所有信息*/
	$scope.show_list=function(){
		$http.get(all_url+"/api/cities").success(function(data){
			$scope.city_list=data;
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
	$scope.add_citys=function(){
		$http({
			method:'POST',			
			url:all_url+"/api/cities",
			data:$.param({
				city_name:$scope.city_name,
				region_id:$scope.region_id
				
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
	$scope.edit_citys=function(id){
		$http({
			method:'GET',
			url:all_url+"/api/cities/"+id,
		}).success(function(data){
			$(".model-show-edit").show();
			$(".change_save").show();
			$(".save").hide();
			$scope.city_name=data.city_name;
			$scope.region_id=data.region_id
			
		})
		$scope.change_citys=function(){
			console.log($(".city").val())
			$http({
				method:'POST',			
				url:all_url+"/api/update/cities/"+id,
				data:$.param({					
					city_name:$scope.city_name,
					region_id:$scope.region_id
				}),
				headers:{"Content-Type":"application/x-www-form-urlencoded"} 
			}).success(function(data){
				$(".model-show").hide();
				$(".model-show-edit").hide();
				$scope.show_list();
			}).error(function(){
				console.log("错误");
			})
		}
	}
	$scope.delete_citys=function(e){
		citys_id=$(e.target).attr("citys_id");
		console.log(citys_id)
		$http({
			method:'POST',
			url:all_url+'/api/delete/cities/'+citys_id,
			data:$.param({}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			citys_id=0;
			$scope.show_list();
		}).error(function(){})
	}
}])