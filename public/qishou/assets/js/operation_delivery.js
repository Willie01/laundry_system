$(".lookInfo-btn").on("click",function(){
	var content=$(this).parent().parent().find("td:nth-of-type(2)").html();
	var num_td=$(this).parent().parent().find("td:nth-of-type(1)").html();
	$(".model-show").show().attr("td_num",num_td);
	$(".delivery_name").val(content);
})
function service_info(){
	var aboutPro_obj={"name":"","mobile":"","address":""}
	aboutPro_obj.name=$(".delivery_name").val();
	aboutPro_obj.mobile=$(".delivery_mobile").val();
	aboutPro_obj.address=$(".delivery_address").val();
	$(".model-show").hide();
	var td_num=parseInt($(".model-show").attr("td_num"))-1;
	$(".table-bordered tbody tr:eq("+td_num+") td:eq(1)").html(aboutPro_obj.name);
}
$(".editType-btn").on("click",function(){
	$(".process-type-model").show();
	var content=$(this).parent().parent().find("td:nth-of-type(2)").html();
	var type_val=$(this).parent().parent().find("td:nth-of-type(3)").attr("value");
	$(".process-type-header").html(content+"的状态")
	$(".process-choose-type").find("option:eq("+type_val+")").attr("selected",true);
})

$(".changePwd-btn").on("click",function(){
	$(".process-changePwd-model").show();
	var content=$(this).parent().parent().find("td:nth-of-type(2)").html();
	$(".process-changePwd-header").html("修改"+content+"的密码")
})
function hideModel(e){
	$(e).hide();
}