var App=angular.module("App_test",[]);
App.controller("loginCtr",["$scope","$http",function($scope,$http){
	/*登陆*/
	$scope.login_this=function(){
		// console.log($(".user_name").val());
		console.log("phone:" + $("#phone").val())
		//console.log(name);
		$http({
			method:'POST',
			url:"/api/factories/login",
			data:$.param({
				phone:$("#phone").val(),
				password:$("#password").val(),				
			}),
			headers:{"Content-Type":"application/x-www-form-urlencoded"}
		}).success(function(data){
			console.log(data);
			if(data.status=='unprocessable_entity'){
				alert("用户不存在")
			}else{
				location.href="index.html";
			}
		}).error(function(){
					
		})
	}

	/*注册*/
	
	$scope.register_this=function(){
		var password=$(".reg_userpwd").val(),		
		re_password=$(".reg_repwd").val();
		$scope.post_info=function(){
			$http({
				method:'POST',
				url:"/api/users",
				data:$.param({
					user_name:$(".reg_username").val(),
					email:$(".reg_useremail").val(),
					password:$(".reg_userpwd").val(),
					re_password:$(".reg_repwd").val()
				}),
				headers:{"Content-Type":"application/x-www-form-urlencoded"}
			}).success(function(data){
				location.href="login.html"
			}).error(function(){
					console.log(error)
			})
		}
		if(!(/^\w{5,16}@/.test($(".reg_useremail").val()))){
				alert("输入错误");
		}else if(password===re_password){
			$scope.post_info();
		}
		
	}
}])








