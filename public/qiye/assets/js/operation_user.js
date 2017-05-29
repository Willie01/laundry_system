var App=angular.module("App_users",[]);
App.controller("usersCtr",["$scope","$http",function($scope,$http){
	var all_url="http://www.tchautchau.cn";
	$scope.show_list=function(){
		$http({
			method:'GET',
			url:all_url+"/api/users",
		}).success(function(data){
			console.log(data);
			$scope.runners_list=data;

		}).error(function(){})

	}
	$scope.show_list();
	var user_id=0;
	$scope.modify_processInfo=function(id){					/*查看并编辑某个用户信息*/
			user_id=id;
			$(".model-show").show();
			$(".add-submit").hide();
			$(".change-submit").show();
			$http({
				method:'GET',
				url:all_url+"/api/users/"+user_id,
			}).success(function(data){
				$(".user_name_input").val(data.username);
				$(".user_city_input").val(data.telphone);
				$(".user_type_input").val(data.email);
		
			}).error(function(){})
		}
	$scope.change_user=function(){			/*提交编辑后的信息*/
		$http({
			method:'POST',
			url:all_url+'/api/update/users/'+user_id,
			data:$.param({
				username:$(".user_name_input").val(),
				telphone:$(".user_city_input").val(),
				email:$(".user_type_input").val(),
			}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			$(".model-show").hide();
			user_id=0;
			$scope.show_list();
		}).error(function(){})
	}
	$scope.delete_user=function(id){
		user_id=id;
		$http({
			method:'POST',
			url:all_url+'/api/delete/users/'+user_id,
			data:$.param({}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			user_id=0;
			$scope.show_list();
		}).error(function(){})
	}
	$scope.hide_model=function(){
		$(".model-show").hide();
	};
	$scope.add_user=function(){
		$(".model-show").show();
		$(".about-process-body").find("input").val("");
		$(".add-submit").show();
		$(".change-submit").hide();
	}
	$scope.submit_user=function(){
		$http({
			method:'POST',
			url:all_url+'/api/users',
			data:$.param({
				username:$(".user_name_input").val(),
				telphone:$(".user_city_input").val(),
				email:$(".user_type_input").val()
			}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			$(".about-process-body").find("input").val("");
			$scope.hide_model();
			$scope.show_list();
		}).error(function(){})
	}
}])













