(function($){
    $.getUrlParam = function(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }
})(jQuery);


function reloadCaptcha() {  
    var obj = document.getElementById('captchaimg');  
    var captchaURL = obj.src+"?nocache=" + Math.floor(Math.random()*100000000 + 100000000);  
    obj.src =captchaURL ;
}
$(document).ready(function(){  
	$("#pop_save").click(function(){
		tipsWindown("产品信息保存到邮箱","iframe:iframe:popSave?productId="
						                          + $(this).attr("data"),"580","215","true","","false","text","");
	});
	$("#pop_city").click(function(){
		tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.jsp","500","200","true","","false","text","");
	});
	$("#pop_question").click(function(){
		tipsWindown("我要提问：", "iframe:iframe:postQuestionForm",
				"550", "465", "true", "", "false", "text", "");
	});
});

setTimeout('_magicTimeout()',20*1000);
function _magicTimeout(){
   $('.time_box').hide();
}

var searchProduct = function(){
		var url = "queryProduct?";
		$(".proSearch").each(function(){
    	var val = $(this).attr("value");
    	if (val) {
    		if($(this).attr("id") == "loanAmt"){
    			//alert($("#select_info_loanIssue").val());
    			url += "loanAmt=" + ($("#select_info_loanAmt").val() + "").replace("万元","") + "&";
    		}else{
    			url += $(this).attr("id") + "=" + val + "&";
    		}
    	}
    	
    });
		document.location.href = url;
};
 var showQuestion = function(target){
	 $("#" + target).toggle();
 };
 
 
 
 (function($){

		$.fn.myScroll = function(options){
		//默认配置
		var defaults = {
			speed:40,  //滚动速度,值越大速度越慢
			rowHeight:24 //每行的高度
		};
		
		var opts = $.extend({}, defaults, options),intId = [];
		
		function marquee(obj, step){
		
			obj.find("ul").animate({
				marginTop: '-=1'
			},0,function(){
					var s = Math.abs(parseInt($(this).css("margin-top")));
					if(s >= step){
						$(this).find("li").slice(0, 1).appendTo($(this));
						$(this).css("margin-top", 0);
					}
				});
			}
			
			this.each(function(i){
				var sh = opts["rowHeight"],speed = opts["speed"],_this = $(this);
				intId[i] = setInterval(function(){
					if(_this.find("ul").height()<=_this.height()){
						clearInterval(intId[i]);
					}else{
						marquee(_this, sh);
					}
				}, speed);

				_this.hover(function(){
					clearInterval(intId[i]);
				},function(){
					intId[i] = setInterval(function(){
						if(_this.find("ul").height()<=_this.height()){
							clearInterval(intId[i]);
						}else{
							marquee(_this, sh);
						}
					}, speed);
				});
			
			});

		}

	})(jQuery);
