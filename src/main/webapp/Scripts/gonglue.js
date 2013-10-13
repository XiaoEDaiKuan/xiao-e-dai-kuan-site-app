
$(document).ready(function(){

           $('#xiaofei').click(
                                   function(){

                                                 $("#xiaofei").addClass("curr");
                                                 $("#jingying").removeClass("curr");
                                                 $("#diya").removeClass("curr");
                                                 $("#wudiya").removeClass("curr");
                                                 $("#xinshou").removeClass("curr");
                                     
                                                 $("#gonglueleixing").val("xiaofeigonglue");
                                                   
                                                 $("#gonglue_form").submit();  

                                               }
                                   );

           $('#jingying').click(
                                   function(){
                                                 $("#xiaofei").removeClass("curr");
                                                 $("#jingying").addClass("curr");
                                                 $("#diya").removeClass("curr");
                                                 $("#wudiya").removeClass("curr");
                                                 $("#xinshou").removeClass("curr");

                                                 $("#gonglueleixing").val("jingyinggonglue");

                                                 $("#gonglue_form").submit();  
                                               }
                                   );

           $('#diya').click(
                                   function(){
                                                 $("#xiaofei").removeClass("curr");
                                                 $("#jingying").removeClass("curr");
                                                 $("#diya").addClass("curr");
                                                 $("#wudiya").removeClass("curr");
                                                 $("#xinshou").removeClass("curr");

                                                 $("#gonglueleixing").val("diyagonglue");
                                   
                                                 $("#gonglue_form").submit();  
                                               }
                                   );


           $('#wudiya').click(
                                   function(){
                                                 $("#xiaofei").removeClass("curr");
                                                 $("#jingying").removeClass("curr");
                                                 $("#diya").removeClass("curr");
                                                 $("#wudiya").addClass("curr");
                                                 $("#xinshou").removeClass("curr");

                                                 $("#gonglueleixing").val("wudiyagonglue");

                                                 $("#gonglue_form").submit();  
                                                     
                                               }
                                   );



           $('#xinshou').click(
                                   function(){
                                                 $("#xiaofei").removeClass("curr");
                                                 $("#jingying").removeClass("curr");
                                                 $("#diya").removeClass("curr");
                                                 $("#wudiya").removeClass("curr");
                                                 $("#xinshou").addClass("curr");

                                                 $("#gonglueleixing").val("xinshougonglue");
                                   
                                                 $("#gonglue_form").submit();  
                                               }
                                   );



})