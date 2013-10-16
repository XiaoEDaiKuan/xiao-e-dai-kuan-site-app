$(document).ready(function(){

             $('#inputOrderInfoSuccess_close').click(
                                     function(){   
                                                  var obj1=window.parent.document.getElementById("windownbg");
                                                  obj1.parentNode.removeChild(obj1);
                                                  
                                                  var obj2=window.parent.document.getElementById("windown-box");
                                                  obj2.parentNode.removeChild(obj2);
                                                  
                                                            
                                         }
                    );

             }
   )