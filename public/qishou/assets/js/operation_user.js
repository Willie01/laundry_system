$(".lookInfo-btn").on("click",function(){
	var content=$(this).parent().parent().find("td:nth-of-type(2)").html();
	var num_td=$(this).parent().parent().find("td:nth-of-type(1)").html();
	$(".model-show").show().attr("td_num",num_td);
	$(".about-process-body div:eq(0) input").val(content);
})

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