<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChkUpRptPrint.aspx.cs"
    Inherits="Chm.Web.Admin.Checkup.ChkUpRptPrint" EnableViewState="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>体检报告</title>
  <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <link href="../../Styles/print.css" rel="stylesheet" type="text/css" /> 
    <style type="text/css">
        .breakPage { page-break-before:always}  
        .afterPage{ page-break-after:always}
        .beforePage{ page-break-before:always}  

   </style>
</head>
<body class="fbg" style="text-align:center">
    <form id="form1" runat="server">
    <div class="print_body2" style="display:none;">
        <div class="cont_body" >
            <div class="logo">
                <img src="../../Image/s_logo.jpg">
            </div>
            <h1 id="hHosName" runat="server">
                </h1>
            <h2>
                体检报告</h2>
            <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" class="print_name" style="margin-top:70px;">
                <tr>
                    <td class="name">
                        体检编号
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlMemberID" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        姓<span class="espce"></span>名
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlName" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        性<span class="espce"></span>别
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlSex" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        年<span class="espce"></span>龄
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlAge" runat="server" ></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        单<span class="espce"></span>位
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlDepart" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        部<span class="espce"></span>门
                    </td>
                    <td class="cont">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        地<span class="espce"></span>址
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlAddress" runat="server">&nbsp;</asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        电<span class="espce"></span>话
                    </td>
                    <td class="cont">
                        &nbsp;<asp:Literal ID="ltlTel" runat="server">&nbsp;</asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        打印日期
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlPrintDate" runat="server"></asp:Literal>
                    </td>
                </tr>
            </table>
            <div class="page_bh">
                编号:<span class="xgfont_ar">
                    <asp:Literal ID="ltlNo" runat="server"></asp:Literal>
                </span>
            </div>
        </div>
        <div class="print_foot1">
            <label id="lHosName" runat="server"></label></br>
             电话:<label id="iPhone" runat="server"></label>；EMAIL：<label id="lAddress" runat="server"></label></br>
            <span class="xgfont">本体检报告仅供临床参考，不作为诊断依据，谢谢您的光临！</span>
        </div>
    </div>   
    <div class="print_body2">
        <div >
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="top_name">
                <tr>
                    <td width="60">
                        ————
                    </td>
                    <%--<td width="120">
                        流水号
                        <asp:Literal ID="ltldjlsh" runat="server"></asp:Literal>
                    </td>--%>
                    <td width="200">
                        体检编号
                        <asp:Literal ID="ltltjbh" runat="server"></asp:Literal>
                    </td>
                    <td width="140">
                        电话号码
                        <asp:Literal ID="ltlMobile" runat="server"></asp:Literal>
                    </td>
                    <td width="150" align="right">
                        <asp:Literal ID="ltlPatientName" runat="server"></asp:Literal>
                        <asp:Literal ID="ltlPatientSex" runat="server"></asp:Literal>
                        <asp:Literal ID="ltlPatientAge" runat="server"></asp:Literal>
                    </td>
                    <td width="60">
                        ————
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabcont">
                <tr>
                    <td class="tit" width="90" valign="top">
                        检查综述：
                    </td>
                    <td class="cont" valign="top">
                        <lable ID="ltllblSummarize" runat="server"></lable>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabcont">
                <tr>
                    <td class="tit2" width="90" valign="top">
                        医生建议：
                    </td>
                    <td class="cont" valign="top">
                        <lable ID="lblAdvice" runat="server"></lable>
                    </td>
                </tr>
            </table>
            <div class="dotname" style="display:none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="doc_name">
                    <tr>
                        <td class="name" width="85">
                            总检医生：
                        </td>
                        <td class="cont" width="90">
                            <asp:Literal ID="lblDocName" runat="server"></asp:Literal>
                        </td>
                        <td class="name" width="100">
                            总检日期：
                        </td>
                        <td class="cont">
                            <asp:Literal ID="lblCheckTime" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            审核医生：
                        </td>
                        <td class="cont">
                            &nbsp;
                        </td>
                        <td class="name">
                            审核日期：
                        </td>
                        <td class="cont">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <br />
               <div class="print_body2">
        
    <table width="100%" cellpadding="0" cellspacing="0" align="center" ><tr><td>
    
    <asp:Literal ID="ltlItemDetail" runat="server">
    </asp:Literal>
    </td></tr></table>
       
    </div>
    <br />
    <div style="text-align: center; padding: 0 0 20px 0" id="btPrint">
        <input type="button" style="padding: 3px 10px; display:none;" value="打印" onclick="Print2()" class="button" />
        <input type="button" style="padding: 3px 10px; display:none" value="返回"  class="button" runat="server" id="btnReturn"/>
        <input type="button" value="关闭"  class="button"  id="btnReturn1" onclick="javascript:window.close()"/>
    </div>
    </form>
</body>
<script language="javascript" type="text/javascript">
  
    //打印前的方法
    function window.onbeforeprint() {
        if (document.getElementById("btPrint") != null)
            document.getElementById("btPrint").style.display = "none";
    }
    var setActive = false;
    function Print2() {
        pagesetup_null();
        if (setActive == false) {
            if (confirm("请启用IE的ActiveX控件!否则可能引起打印不美观。是否要继续打印？")) {
                window.print();
                document.getElementById("btPrint").style.display = "block";
            }
            else {
                document.getElementById("btPrint").style.display = "block";
            }
        }
        else {
            window.print();
            document.getElementById("btPrint").style.display = "block";
        }
        //window.location.reload();
    }
 
    var hkey_root, hkey_path, hkey_key
    hkey_root = "HKEY_CURRENT_USER"
    hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"
    //设置网页打印的页眉页脚为空,打印背景色
    function pagesetup_null() {
        try {
            var RegWsh = new ActiveXObject("WScript.Shell")
            hkey_key = "header"
            RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "")

            hkey_key = "footer"
            //RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "&w&b页码，&p/&p")
            RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "")
            hkey_key = "Print_Background"
            RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "yes")

            hkey_key = "margin_top"; //注册表中的0.75对应于网页的19.05
            RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.18");

            hkey_key = "margin_bottom"; //注册表中的0.75对应于网页的19.05
            RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.18");

            hkey_key = "margin_left"; //注册表中的0.75对应于网页的19.05
            RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.3");

            hkey_key = "margin_right"; //注册表中的0.75对应于网页的19.05
            RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.2");
            setActive = true;

        } catch (e) { }
    }
    window.onload = function () {
        var theDiv = document.getElementsByTagName("div")[0];
        theDiv.parentNode.removeChild(theDiv);        
    }
</script>
</html>
