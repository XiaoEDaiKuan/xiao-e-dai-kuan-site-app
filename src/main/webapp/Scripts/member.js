$(document).ready(
		function() {
			$(".pop_del").click(
					function() {
						tipsWindown("提示", "iframe:iframe:pop_DeleteCredit?creditId="
						                          + $(this).attr("data") , "345",
								"145", "true", "", "false", "text", function(){location.reload()});
					});
			$(".pop_Cancel_order").click(
					function() {
						tipsWindown("取消订单",
								"iframe:iframe:pop_CancelOrder?orderid="
										+ $(this).attr("data"), "345", "140",
								"true", "", "false", "text", function() {
									location.reload();
									
								});
					});
			$("#pop_del").click(
					function() {
						tipsWindown("提示", "iframe:iframe:pop_删除记录.html", "345",
								"145", "true", "", "false", "text", "");
					});
			$("#pop_information").click(
					function() {
						tipsWindown("身份信息",
								"iframe:iframe:pop_information.html", "420",
								"180", "true", "", "false", "text", "");
					});
			$("#pop_contact").click(
					function() {
						tipsWindown("联系方式", "iframe:iframe:modifyMyInfo",
								"420", "250", "true", "", "false", "text", "");
					});
		});

setTimeout('_magicTimeout()', 20 * 1000);
function _magicTimeout() {
	$('.time_box').hide();
}

tipsWindown.close = function () {
  $(".pop_cancel").remove();
  $("#windown-box").fadeOut("slow", function () { $(this).remove(); });
}