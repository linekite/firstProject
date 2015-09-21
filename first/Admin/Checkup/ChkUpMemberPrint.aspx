<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChkUpMemberPrint.aspx.cs"
    Inherits="Chm.Web.Admin.Checkup.ChkUpMemberPrint" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="/Js/jquery-1.4.1.js" type="text/javascript"></script>
<link href="../../Styles/MsgBox.css" type="text/css" rel="Stylesheet" />
<script src="../../Scripts/scr.js" type="text/javascript"></script>
   <script src="/Js/common.js" type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
     <script src="/Js/resouces-zh-CN.js" type="text/javascript"></script>
     <script src="/Js/resouces-en-US.js" type="text/javascript"></script>

<head id="Head1" runat="server">
    <title>体检报告</title>
    <style type="text/css" media="print">
        .Noprint
        {
            display: none;
        }
    </style>
    <style type="text/css">
        .button
        {
            background-image: url(/Images/AM/ta_g.gif);
            background-repeat: repeat-x;
        }
        .printlink
        {
            text-decoration: none;
            color: Red;
            font-weight: bold;
        }
        .tipdiv
        {
            border: 2px solid #0072E3;
            z-index: 9999;
            width: 800px;
            height: 500px;
            display: none;
            position: fixed !important; /* FF IE7*/
            position: absolute; /*IE6*/
        }
        
        .divtop
        {
            background-color: #66B3FF;
            width: 100#;
            font-size: 14px;
            height: 20px;
            color: #fff;
            padding-top: 3px;
            text-align: left;
            vertical-align: text-bottom;
            border-bottom: 1px solid #0080FF;
        }
        .divtop a
        {
            float: right;
            text-decoration: none;
            color: Black;
        }
        .divcontent
        {
            background-color: #fff;
            width: 100%;
            height: 480px;
            font-size: 12px;
            text-align: left;
            overflow: auto;
        }
    </style>
    <%--    <link href="../../Styles/base.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />--%>
    <link href="../../Styles/print.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .breakPage
        {
            page-break-before: always;
        }
        .afterPage
        {
            page-break-after: always;
        }
        .beforePage
        {
            page-break-before: always;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="print_body2">
        <div style="height: 40px" class="Noprint">
            <font color="red" size="3px">
                <marquee>点击【检查综述】和【医生建议】中红色字体可显示相应知识链接</marquee>
            </font>
            <hr />
        </div>
        <div class="cont_body" style="display: none;">
            <%if (DataFrom == 0)
              { %>
            <div class="logo" style="vertical-align: text-bottom;">
                <img width="120" height="112" src="../../Image/log2.jpg">
            </div>
            <%}else
              { %>
            <div class="logo" style="vertical-align: text-bottom;">
                <img src="../../Image/s_logo.jpg">
            </div>
            <%} %>
            <h1 id="hHosName" runat="server">
            </h1>
            <h2>
                体检报告</h2>
            <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" class="print_name"
                style="margin-top: 70px;">
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
                        姓名
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlName" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        性别
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlSex" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="name">
                        年龄
                    </td>
                    <td class="cont">
                        <asp:Literal ID="ltlAge" runat="server"></asp:Literal>
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
                        &nbsp;<asp:Literal ID="ltlTel" runat="server"></asp:Literal>
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
        <div class="print_foot" style="display: none;">
            <label id="lHosName" runat="server">
            </label>
            </br> 电话:<label id="iPhone" runat="server"></label>；EMAIL：<label id="lAddress" runat="server"></label></br>
            <span class="xgfont">本体检报告仅供临床参考，不作为诊断依据，谢谢您的光临！</span>
        </div>
    </div>
    <%--    <div style="page-break-before: always">
    </div>--%>
    <div class="print_body2">
        <div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="top_name">
                <tr>
                    <td width="45">
                        ———
                    </td>
                    <td width="125">
                        流水号
                        <asp:Literal ID="ltldjlsh" runat="server"></asp:Literal>
                    </td>
                    <td width="125">
                        体检编号
                        <asp:Literal ID="ltltjbh" runat="server"></asp:Literal>
                    </td>
                    <td>
                        电话号码
                        <asp:Literal ID="ltlMobile" runat="server"></asp:Literal>
                    </td>
                    <td width="150" align="right">
                        <asp:Literal ID="ltlPatientName" runat="server"></asp:Literal>
                        <asp:Literal ID="ltlPatientSex" runat="server"></asp:Literal>
                        <asp:Literal ID="ltlPatientAge" runat="server"></asp:Literal>
                    </td>
                    <td width="45">
                        ———
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabcont">
                <tr>
                    <td class="tit" width="90" valign="top">
                        检查综述：
                    </td>
                    <td class="cont" valign="top">
                        <lable id="ltllblSummarize" runat="server"></lable>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabcont">
                <tr>
                    <td class="tit2" width="90" valign="top">
                        医生建议：
                    </td>
                    <td class="cont" valign="top">
                        <lable id="lblAdvice" runat="server"></lable>
                    </td>
                </tr>
            </table>
            <div class="dotname" style="display: none">
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
    
    <asp:Literal ID="ltlItemDetail" runat="server"></asp:Literal>
          </td></tr></table>
       
    </div>
    <br />

    <div id="mjs:tip" class="tipdiv">
        <div class="divtop">
            <div id="mjs:title" style="float: left;">
                说明</div>
            <a href="javascript:void(0);" onclick="closediv()">【关闭】</a></div>
        <div id="mjs:content" class="divcontent">
        </div>
    </div>
    <div id="popshowdiv">
    </div>
    <div id="q_Msgbox" class="hide" align="center">
        <span id="mode_tips_v2" class="qz_msgbox_layer" style="z-index: 10000;"><span class="gtl_ico_clear">
        </span>
            <img alt="" src="../../image/loading.gif" />
            正在打开，请耐心等待... <span class="gtl_end"></span></span>
    </div>
    <%if (GetDatsSoure != "HealthArchive")
      { %>
    <div style="text-align: center; padding: 0 0 20px 0">
        <input type="button" id="btnPrint" value="打印" onclick="PrintingWord();" class="button" />   
       
        <input type="button" value="关闭"  onclick="closeWindow();" class="button" />
    </div>
      <Chy:XButton id="btnPPrint" runat="server" text="打印" cssclass="button"  onclick="btnPrint_ProntWord"   OnClientClick="PrintingWord();" style="display: none;" />     
     <Chy:XButton id="btnExport" runat="server" text="下载" cssclass="button" onclick="btnExport_Click"
        style="display: none;" />
<%} %>
          
    </form>
</body>
<script language="javascript" type="text/javascript">

    function PrintingWord() {
        $("#q_Msgbox").removeClass("hide");
        document.getElementById("<%=btnPPrint.ClientID %>").click();
    }

    function PrintSussesWord(url) {
        $("#q_Msgbox").addClass("hide");
        document.getElementById("<%=btnExport.ClientID %>").click();

    }
    var hkey_root, hkey_path, hkey_key
    hkey_root = "HKEY_CURRENT_USER"
    hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"
    //打印前的方法
    function window.onbeforeprint() {
        //pagesetup_null();
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
    function BackLoad() {
        var browserName = navigator.appName;
        if (browserName == "Netscape") {
            window.open('', '_parent', '');
            window.close();
        } else if (browserName == "Microsoft Internet Explorer") {
            window.opener = null;
            window.open('', '_self', ''); //for IE7
            window.close();
        }
        else {
            window.close();
        }
    }
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
//        var theDiv = document.getElementsByTagName("div")[0];
//        theDiv.parentNode.removeChild(theDiv);
    }

    // ======================js create by kent.zou  begin==========================================================
    function closediv() {
        var obj = M('popshowdiv');
        var width = obj.style.width;
        var height = obj.style.height;
        popClose(obj, 0, parseInt(width.replace('px', '')), parseInt(height.replace('px', '')), isIE(), M("thisbg"));
        delete obj;
    }
    // 得到隐藏网页头部隐藏高度
    function getDocScrollPos() {
        var y = document.body.scrollTop || document.documentElement.scrollTop || window.pageYOffset || 0;
        return y;
    }

    function isFireFox() {
        return navigator.userAgent.indexOf('Firefox') >= 0;
    }

    function getClientHeight() {
        if (isFireFox()) return window.innerHeight;
        return document.body.clientHeight;
    }
    function showdiv(obj) {
        // 动态创建背景
        popBgDiv("thisbg");
        // 创建弹出层
        var thistip = M("popshowdiv");
        var showContentHtml = obj.getAttribute("tips");
        if (showContentHtml != undefined && showContentHtml != null) {
            var titlecontent = obj.innerHTML;
            if (titlecontent.length > 20) {
                titlecontent = titlecontent.substring(0, 20) + "...";
            }
            //thistip.style = "tipdiv";
            thistip.style.position = "absolute";
            thistip.style.border = "2px solid #0072E3";
            thistip.style.background = "#fff";
            thistip.style.display = "block";
            thistip.style.overflow = "hidden";
            thistip.style.zIndex = 9998;
            var bodySize = getBodySize();
            thistip.style.left = (bodySize[0]) / 2 + "px";
            var height1 = getClientHeight();
            thistip.style.top = getDocScrollPos() + (height1 / 2) + "px";

            thistip.style.width = "0px";
            thistip.style.height = "0px";
            popShow(thistip, 0, 800, 500, isIE(), showContentHtml, titlecontent);
        }

    }

    function M(id) {
        return document.getElementById(id); //用M()方法代替document.getElementById(id)
    }
    function MC(t) {
        return document.createElement(t); //用MC()方法代替document.createElement(t)
    };
    //判断浏览器是否为IE
    function isIE() {
        return (document.all && window.ActiveXObject && !window.opera) ? true : false;
    }
    //取得页面的高宽
    function getBodySize() {
        var bodySize = [];
        with (document.body) {
            bodySize[0] = (scrollWidth > clientWidth) ? scrollWidth : clientWidth; //如果滚动条的宽度大于页面的宽度，取得滚动条的宽度，否则取页面宽度
            bodySize[1] = (scrollHeight > clientHeight) ? scrollHeight : clientHeight; //如果滚动条的高度大于页面的高度，取得滚动条的高度，否则取高度
        }
        return bodySize;
    }

    //创建遮盖层
    function popBgDiv(id) {
        var bodySize = getBodySize();
        if (M(id)) {
            //如果存在遮盖层，则让其显示
            M(id).style.display = 'block';
            M(id).style.width = bodySize[0] + 'px'
            M(id).style.height = bodySize[1] + 'px';
        } else {
            //否则创建遮盖层
            var coverDiv = MC('div');
            document.body.appendChild(coverDiv);
            coverDiv.id = id;
            with (coverDiv.style) {
                position = 'absolute';
                background = '#CCCCCC';
                left = '0px';
                top = '0px';

                width = bodySize[0] + 'px'
                height = bodySize[1] + 'px';
                zIndex = 0;
                if (isIE()) {
                    filter = "Alpha(Opacity=50)"; //IE逆境
                } else {
                    opacity = 0.5;
                }
            }
        }
    }

    /*
    == 逐渐放大效果 ==
    obj：控件对象
    i：循环次数
    width：弹出层宽
    height：弹出层高
    isIe：是否是ie浏览器
    */
    function popShow(obj, i, width, height, isIe, html, title) {
        var bodySize = getBodySize();
        var hidTop = getDocScrollPos();
        i = parseInt(i);
        if (i == NaN) return;
        var height1 = getClientHeight();

        if (isIe) {
            // 计算浏览器可显示部分像素的大小
            var scrollWidth = document.body.clientWidth;
            width = scrollWidth > width ? width : scrollWidth;
            height = height1 > height ? height : height1;
        }

        // 计算空隙部分
        if (width > (i * i * 4)) {
            obj.style.left = (bodySize[0] - i * i * 4) / 2 + "px";
            obj.style.width = i * i * 4 + "px";
        } else {
            obj.style.left = (bodySize[0] - width) / 2 + "px";
            obj.style.width = width + "px";
        }
        if (height > (i * i * 2)) {
            obj.style.top = (hidTop + (height1 - i * i * 2) / 2) + "px";
            obj.style.height = i * i * 2 + "px";
        } else {
            obj.style.top = hidTop + (height1 - height) / 2 + "px";
            obj.style.height = height + "px";
        }
        if ((width > (i * i * 4)) || (height > (i * i * 2))) {
            i++;
            setTimeout(function () { popShow(obj, i, width, height, isIe, html, title); }, 5);
        } else {
            var strHtml = "<div class='divtop' >";
            strHtml += "<div style='float:left;'>说明—" + title + "</div>";
            strHtml += "<a href='javascript:closediv();' onmouseover = 'changeToClickStyle(this)' onmouseout = 'changeToOutStyle(this)' >【关闭】</a>";
            strHtml += "</div>";
            // 如果需要跨域，则使用注释掉的代码
            //            if (isIe) {
            //                strHtml += "<div class='divcontent' ><iframe width="+(width-4)+" height="+(height-24)+" frameborder=0 scrolling=auto src=/hc/Admin/checkup/AnomalyIndexDetail.aspx?id="+html+"></iframe></div>";
            //            } else {
            //                strHtml += "<div class='divcontent'><iframe width=" + width + " height=" + (height - 22) + " frameborder=0 scrolling=auto src=/hc/Admin/checkup/AnomalyIndexDetail.aspx?id=" + html + "></iframe></div>";
            //            }
            if (isIe) {
                strHtml += "<div class='divcontent' id='divShowThisContent' style='padding:10px;height:" + (height - 24) + "px;' >请稍后。。。</div>";
            } else {
                strHtml += "<div class='divcontent' id='divShowThisContent' style='padding:10px;width:" + (width - 20) + "px;height:" + (height - 44) + "px;' >请稍后。。。</div>";
            }
            obj.innerHTML = strHtml;

            // ================ new code for test ==========================
            createRequest();
            var url = "/hc/Admin/checkup/AnomalyIndexDetail1.aspx?id=" + html;
            request.open("GET", url, true);
            request.onreadystatechange = updatePage;
            request.send(null);
        }
    }

    //
    function popClose(obj, i, width, height, isIe, objback) {
        var bodySize = getBodySize();
        var hidTop = getDocScrollPos();
        i = parseInt(i);
        if (i == NaN) return;
        var height1 = getClientHeight();

        // 计算空隙部分
        if (width > (i * i * 4)) {
            obj.style.left = ((bodySize[0] - width) / 2 + (i * i * 2)) + "px";
            obj.style.width = (width - (i * i * 4)) + "px";
        } else {
            obj.style.left = (bodySize[0]) / 2 + "px";
            obj.style.width = "0px";
        }

        if (height > (i * i * 2.5)) {
            obj.style.top = (hidTop + (height1 - height) / 2.5 + i * i) + "px";
            obj.style.height = (height - i * i * 2.5) + "px";
        } else {
            obj.style.top = hidTop + (height1) / 2 + "px";
            obj.style.height = "0px";
        }
        if ((width > (i * i * 4)) || (height > (i * i * 2.5))) {
            i++;
            setTimeout(function () { popClose(obj, i, width, height, isIe, objback); }, 5);
        } else {
            obj.style.display = 'none';
            objback.style.display = 'none';
            obj.innerHTML = "";
        }
    }

    function changeToClickStyle(obj) {
        obj.style.color = '#FF0000'
    }
    function changeToOutStyle(obj) {
        obj.style.color = '#000'
    }

    // ===========================new code ======================
    var request = false;
    function createRequest() {
        try {
            // code for IE7, Firefox, Opera, etc.
            request = new XMLHttpRequest();
        } catch (trymicrosoft) {
            try {
                // code for IE7+
                request = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (othermicrosoft) {
                try {
                    // code for IE6, IE5
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (failed) {
                    request = false;
                }
            }
        }
        if (!request)
            alert("Error initializing XMLHttpRequest!");
    }
    function updatePage() {
        if (request.readyState == 4) {
            if (request.status == 200) {
                var response = request.responseText;
                M("divShowThisContent").innerHTML = response;
            } else
                M("divShowThisContent").innerHTML = "对不起，请求页面出现异常"; ;
        }
    }

    window.onresize = function () {
        var div = M("popshowdiv");
        if (div.innerHTML != null && div.innerHTML != '') {
            popBgDiv("thisbg");
            var top = getDocScrollPos();
            var height = getClientHeight();
            if (document.body.clientWidth > 800) {
                div.style.left = (document.body.clientWidth - 800) / 2 + "px";
            } else {
                div.style.left = "0px";
            }
            if (height > 500) {
                div.style.top = top + (height - 500) / 2 + "px";
            } else {
                div.style.top = top + "px";
            }
        }
    }

</script>


</html>
