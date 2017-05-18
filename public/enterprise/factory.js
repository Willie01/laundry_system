function showFactories(){
	$.ajax({
		type:"get",
		url:all_url+"/api/factories",
		async:true,
		data:{},
		dataType:"json",
		beforeSend:function(xhr){
//			console.log(xhr)
//			console.log("请求前")
		},
		success:function(data,textStatus,jqXHR){
			console.log(data)
		},
		error:function(xhr,textStatus){
			console.log("错误")
//			console.log(xhr);
//			console.log(textStatus);
		},
		complete:function(){
//			console.log("结束")
		}
	});
}