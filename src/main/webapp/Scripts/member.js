$(document).ready(
		function() {
			$("#pop_del").click(
					function() {
						tipsWindown("提示", "iframe:iframe:pop_删除记录.html", "345",
								"145", "true", "", "false", "text", "");
					});
			$(".pop_Cancel_order").click(
					function() {
						tipsWindown("取消订单", "iframe:iframe:pop_CancelOrder.html?orderid=" + $(this).attr("data"),
								"345", "140", "true", "", "false", "text", "");
					});
		});

setTimeout('_magicTimeout()', 20 * 1000);
function _magicTimeout() {
	$('.time_box').hide();
}