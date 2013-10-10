var layer = function(){
	   $("#brg").css("display","block");
	   $("#showdiv").css("display","block");
	   //$("#testdiv").load("test.html");
};
$(document).ready(function(){
   var bheight=document.body.clientHeight;
  //layer();
   $("#close").click(function(){
      $("#brg").css("display","none");
      $("#showdiv").css("display","none");
   //$("#testdiv").load("");
   });
});