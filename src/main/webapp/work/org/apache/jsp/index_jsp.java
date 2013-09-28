package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<title>无标题文档</title>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "globalScript.jsp", out, false);
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\t$(document).ready(function() {\n");
      out.write("\t$(\"#pop_city\").click(function(){\n");
      out.write("\t\ttipsWindown(\"您可以选择以下地区：\",\"iframe:iframe:pop_city.html\",\"500\",\"200\",\"true\",\"\",\"false\",\"text\",\"\");\n");
      out.write("\t});\n");
      out.write("\t$(\"#pop_question\").click(function(){\n");
      out.write("\t\ttipsWindown(\"我要提问：\",\"iframe:iframe:pop_question.html\",\"550\",\"465\",\"true\",\"\",\"false\",\"text\",\"\");\n");
      out.write("\t});\n");
      out.write("\t\n");
      out.write("\t});\t\n");
      out.write("\t\n");
      out.write("\tsetTimeout('_magicTimeout()',20*1000);\n");
      out.write("    function _magicTimeout(){\n");
      out.write("\t   $('.time_box').hide();\n");
      out.write("    }\t\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "globalHeader.jsp", out, false);
      out.write("\n");
      out.write("<div id=\"full-screen-slider\">\n");
      out.write("  <ul id=\"slides\">\n");
      out.write("    <li class=\"pic1\"><a href=\"#\"></a></li>\n");
      out.write("    <li class=\"pic2\"><a href=\"#\"></a></li>\n");
      out.write("    <li class=\"pic3\"><a href=\"#\"></a></li>\n");
      out.write("  </ul>\n");
      out.write("  <div class=\"sy_login\">\n");
      out.write("    <div class=\"sy_login1\">\n");
      out.write("    </div>\n");
      out.write("    <div class=\"sy_login2\">\n");
      out.write("      <h1>玖富专业贷款搜索平台</h1>\n");
      out.write("      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("        <tr>\n");
      out.write("          <th width=\"20%\">职业身份：</th>\n");
      out.write("          <td><div id=\"tm2008style\">\n");
      out.write("\t<select name=\"language_tm20081\" id=\"language_tm2008\">\n");
      out.write("\t\t<option value=\"企业主\">企业主</option>\n");
      out.write("\t\t<option value=\"个体户\" >个体户</option>\n");
      out.write("\t\t<option value=\"上班族\" >上班族</option>\n");
      out.write("\t\t<option value=\"无固定职业\" >无固定职业</option>\n");
      out.write("\t</select>\n");
      out.write("</div></td>\n");
      out.write("          <td>&nbsp;</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <th>贷款用途：</th>\n");
      out.write("          <td><div id=\"tm2008style\">\n");
      out.write("\t<select name=\"language_tm20082\" id=\"language_tm2008\">\n");
      out.write("\t\t<option value=\"不限\">不限</option>\n");
      out.write("\t\t<option value=\"经营贷款\" >经营贷款</option>\n");
      out.write("\t\t<option value=\"消费贷款\" >消费贷款</option>\n");
      out.write("\t\t<option value=\"购车贷款\" >购车贷款</option>\n");
      out.write("\t\t<option value=\"购房贷款\" >购房贷款</option>\n");
      out.write("\t</select>\n");
      out.write("</div></td>\n");
      out.write("          <td>&nbsp;</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <th>贷款金额：</th>\n");
      out.write("          <td><div id=\"tm2008style\">\n");
      out.write("\t<select name=\"language_tm20083\" id=\"language_tm2008\">\n");
      out.write("\t\t<option value=\"万元\">万元</option>\n");
      out.write("\t\t<option value=\"3万元\" >3万元</option>\n");
      out.write("\t\t<option value=\"5万元\" >5万元</option>\n");
      out.write("\t\t<option value=\"10万元\" >10万元</option>\n");
      out.write("\t\t<option value=\"20万元\" >20万元</option>\n");
      out.write("\t\t<option value=\"50万元\" >50万元</option>\n");
      out.write("\t\t<option value=\"100万元\" >100万元</option>\n");
      out.write("\t\t<option value=\"其他\" >其他</option>\n");
      out.write("\t</select>\n");
      out.write("</div></td>\n");
      out.write("          <td>不足1万可用小数表示</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <th>贷款期限：</th>\n");
      out.write("          <td><div id=\"tm2008style\">\n");
      out.write("\t<select name=\"language_tm20084\" id=\"language_tm2008\">\n");
      out.write("\t\t<option value=\"3个月\">3个月</option>\n");
      out.write("\t\t<option value=\"6个月\" >6个月</option>\n");
      out.write("\t\t<option value=\"12个月\" selected=\"selected\" >12个月</option>\n");
      out.write("\t\t<option value=\"2年\" >2年</option>\n");
      out.write("\t\t<option value=\"3年\" >3年</option>\n");
      out.write("\t\t<option value=\"5年\" >5年</option>\n");
      out.write("\t\t<option value=\"10年\" >10年</option>\n");
      out.write("\t</select>\n");
      out.write("</div></td>\n");
      out.write("          <td>&nbsp;</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td>&nbsp;</td>\n");
      out.write("          <td><a href=\"贷款搜索.html\"><input name=\"\" type=\"button\" value=\"\" class=\"btn1\" /></a></td>\n");
      out.write("          <td>&nbsp;</td>\n");
      out.write("        </tr>\n");
      out.write("      </table>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"main1\">\n");
      out.write("  <ul>\n");
      out.write("    <li class=\"short\"><a href=\"快速贷款专区.html\" target=\"_blank\"><b>快速贷款专区</b><br />\n");
      out.write("      资金要得急 还款期限短</a></li>\n");
      out.write("    <li class=\"high\"><a href=\"提高额度专区.html\" target=\"_blank\"><b>提高额度专区</b><br />\n");
      out.write("      分级评分 逐级增加额度</a></li>\n");
      out.write("    <li class=\"pos\"><a href=\"#\"><b>POS贷款专区</b><br />\n");
      out.write("      POS流水评估 简便贷款</a></li>\n");
      out.write("    <li class=\"loan\"><a href=\"#\"><b>XX贷款专区</b><br />\n");
      out.write("      简单说明</a></li>\n");
      out.write("  </ul>\n");
      out.write("</div>\n");
      out.write("<div class=\"main2\">\n");
      out.write("  <div class=\"main2_left\">\n");
      out.write("    <div class=\"credit ground\">\n");
      out.write("      <div class=\"credit_title\"> <span class=\"credit_title1 font_f\">热门信用贷款</span> <span class=\"credit_title2\">无需抵押 担保</span> <a target=\"_blank\" href=\"贷款搜索.html\">更多信用贷款</a> </div>\n");
      out.write("      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"table\">\n");
      out.write("        <tr>\n");
      out.write("          <td width=\"11%\"><img src=\"images/credit01.jpg\" width=\"40\" height=\"21\" /></td>\n");
      out.write("          <td width=\"18%\">平安银行-新一贷</td>\n");
      out.write("          <td width=\"61%\">有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td width=\"10%\"><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit02.jpg\" width=\"39\" height=\"22\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit03.jpg\" width=\"25\" height=\"24\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit04.jpg\" width=\"18\" height=\"22\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit05.jpg\" width=\"25\" height=\"12\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("      </table>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"credit ground\">\n");
      out.write("      <div class=\"credit_title\"> <span class=\"credit_title1 font_f\">热门特色贷款</span></div>\n");
      out.write("      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"table\">\n");
      out.write("        <tr>\n");
      out.write("          <td width=\"11%\"><img src=\"images/credit01.jpg\" width=\"40\" height=\"21\" /></td>\n");
      out.write("          <td width=\"18%\">平安银行-新一贷</td>\n");
      out.write("          <td width=\"61%\">有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td width=\"10%\"><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit02.jpg\" width=\"39\" height=\"22\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit03.jpg\" width=\"25\" height=\"24\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit04.jpg\" width=\"18\" height=\"22\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("          <td><img src=\"images/credit05.jpg\" width=\"25\" height=\"12\" /></td>\n");
      out.write("          <td>平安金融-薪金贷</td>\n");
      out.write("          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>\n");
      out.write("          <td><a href=\"产品申请.html\" target=\"_blank\">查看</a></td>\n");
      out.write("        </tr>\n");
      out.write("      </table>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"main2_right\">\n");
      out.write("    <div class=\"ad1\"><a href=\"产品申请.html\" target=\"_blank\"></a></div>\n");
      out.write("    <div class=\"sina\">\n");
      out.write("      <div class=\"sina_border\">\n");
      out.write("      <div class=\"sina1\"><a href=\"#\" class=\"sina2\"></a><p>平台微博加关注</p></div>\n");
      out.write("      <div class=\"sina1\"><a href=\"#\" class=\"weixin\"></a><p>平台微信二维码</p></div> \n");
      out.write("      </div>   \n");
      out.write("    </div>\n");
      out.write("    <div class=\"assistant ground\">\n");
      out.write("      <div class=\"credit_title\"> <span class=\"credit_title1 font_f\">贷款助手</span></div>\n");
      out.write("      <div class=\"assistant1\">\n");
      out.write("        <div class=\"assistant1_1\"><a href=\"score_choose.html\" class=\"cal\" target=\"_blank\"></a></div>\n");
      out.write("        <div class=\"assistant1_2\"><a href=\"score_choose.html\" target=\"_blank\">云信用评分器</a><br />测测你能贷多少</div>\n");
      out.write("      </div>\n");
      out.write("     \n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"main3 padding-bt ground\">\n");
      out.write("  <div class=\"credit_title\"> \n");
      out.write("    <span class=\"credit_title1 font_f\">云金融平台</span>\n");
      out.write("    <p>XX家银行 XX家小贷公司  XX家分支机构组成  覆盖全国XX地区的云金融网络</p>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"cloud\">\n");
      out.write("    <div id=\"demo\">\n");
      out.write("    <div id=\"indemo\">\n");
      out.write("    <div id=\"demo1\">\n");
      out.write("    <div><img src=\"images/bank01.jpg\" width=\"116\" height=\"28\" /><br /><img src=\"images/bank02.jpg\" width=\"116\" height=\"28\" /></div>\n");
      out.write("    <div><img src=\"images/bank01.jpg\" width=\"116\" height=\"28\" /><br /><img src=\"images/bank02.jpg\" width=\"116\" height=\"28\" /></div>\n");
      out.write("    <div><img src=\"images/bank01.jpg\" width=\"116\" height=\"28\" /><br /><img src=\"images/bank02.jpg\" width=\"116\" height=\"28\" /></div>\n");
      out.write("    <div><img src=\"images/bank01.jpg\" width=\"116\" height=\"28\" /><br /><img src=\"images/bank02.jpg\" width=\"116\" height=\"28\" /></div>\n");
      out.write("    <div><img src=\"images/bank01.jpg\" width=\"116\" height=\"28\" /><br /><img src=\"images/bank02.jpg\" width=\"116\" height=\"28\" /></div>\n");
      out.write("    <div><img src=\"images/bank01.jpg\" width=\"116\" height=\"28\" /><br /><img src=\"images/bank02.jpg\" width=\"116\" height=\"28\" /></div>\n");
      out.write("    <div><img src=\"images/bank01.jpg\" width=\"116\" height=\"28\" /><br /><img src=\"images/bank02.jpg\" width=\"116\" height=\"28\" /></div>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"demo2\"></div>\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("    <script>\n");
      out.write("\t<!--\n");
      out.write("\tvar speed=20;\n");
      out.write("\tvar tab=document.getElementById(\"demo\");\n");
      out.write("\tvar tab1=document.getElementById(\"demo1\");\n");
      out.write("\tvar tab2=document.getElementById(\"demo2\");\n");
      out.write("\t\n");
      out.write("\ttab2.innerHTML=tab1.innerHTML;\n");
      out.write("\tfunction Marquee(){\n");
      out.write("\tif(tab2.offsetWidth-tab.scrollLeft<=0)\n");
      out.write("\ttab.scrollLeft-=tab1.offsetWidth\n");
      out.write("\telse{\n");
      out.write("\ttab.scrollLeft++;\n");
      out.write("\t}\n");
      out.write("\t}\n");
      out.write("\tvar MyMar=setInterval(Marquee,speed);\n");
      out.write("\ttab.onmouseover=function() {clearInterval(MyMar)};\n");
      out.write("\ttab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};\n");
      out.write("\t-->\n");
      out.write("\t</script>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"main4\">\n");
      out.write("  <div class=\"ask ground\">\n");
      out.write("    <div class=\"credit_title\"> <span class=\"credit_title1 font_f\">大家都在问</span> <a target=\"_blank\" href=\"贷款问答1.html\">更多问题</a><input name=\"\" type=\"button\" value=\"我要提问\" id=\"pop_question\" /> </div>\n");
      out.write("    <ul class=\"question_list\">\n");
      out.write("      <li><a href=\"贷款问答2.html\" target=\"_blank\">我有逾期贷哇5个回答</a></li>\n");
      out.write("      <li><a href=\"贷款问答2.html\" target=\"_blank\">房地产公司上班可以贷款吗？</a></li>\n");
      out.write("      <li><a href=\"贷款问答2.html\" target=\"_blank\">本人现在的月收入在2000至3000左右，且本单位...</a></li>\n");
      out.write("      <li><a href=\"贷款问答2.html\" target=\"_blank\">我现在在工厂打工，月收入3500，有工资卡作证。想...</a></li>\n");
      out.write("      <li class=\"border-bt\"><a href=\"贷款问答2.html\" target=\"_blank\">我在人人贷的贷款被拒，还能在友信贷款吗？</a></li>\n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"strategy ground\">\n");
      out.write("    <div class=\"credit_title\"> <span class=\"credit_title1 font_f\">贷款攻略</span> <a target=\"_blank\" href=\"贷款攻略.html\">更多</a></div>\n");
      out.write("    <ul class=\"strategy_list\">\n");
      out.write("      <li><a href=\"贷款攻略2.html\" target=\"_blank\">得不偿失？信用卡购车小心捆绑保险</a></li>\n");
      out.write("      <li><a href=\"贷款攻略2.html\" target=\"_blank\">新版信用报告的不良记录是怎么算的？</a></li>\n");
      out.write("      <li><a href=\"贷款攻略2.html\" target=\"_blank\">看中介攻心术如何让你\"非买不可\"</a></li>\n");
      out.write("      <li><a href=\"贷款攻略2.html\" target=\"_blank\">购买二手房 你可能忽视了这些</a></li>\n");
      out.write("      <li><a href=\"贷款攻略2.html\" target=\"_blank\">5种贷款方式大汇总 谁是你心中的主角</a></li>\n");
      out.write("      <li><a href=\"贷款攻略2.html\" target=\"_blank\">看中介攻心术如何让你\"非买不可\"</a></li>\n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "globalFooterMenu.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "globalFooter.jsp", out, false);
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
