function showDiv(){
	document.getElementById('popDiv').style.display='block';
	document.getElementById('popIframe').style.display='block';
	document.getElementById('bg').style.display='block';
}
function closeDiv(){
	document.getElementById('popDiv').style.display='none';
	document.getElementById('bg').style.display='none';
	document.getElementById('popIframe').style.display='none';
}

function saveCreditCust() {
	$.ajax({
		url :'createCreditCust',
		type :'post',
		data: {
			custName: $("#custName").val(), 
			mobileNO: $("#mobileNO").val()
		},
		dataType: "text",
		success: function (data) {
			if (data == "success") {
				$("#myPopFont").html("提交成功！");
				$("#myPopPrg").html("9F云金融客服代表会尽快联系您。");
				showDiv();
			} else {
				$("#myPopFont").html("提交失败！");
				$("#myPopPrg").html(" ");
				showDiv();
			}
		}
	});
}
