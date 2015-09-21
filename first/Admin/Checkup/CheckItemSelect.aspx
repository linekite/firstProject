<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckItemSelect.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckItemSelect" %>
<!doctype html>
<!--[if lt IE 7 ]> <html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="ie ie7" lang="zh-CN"> <![endif]-->
<!--[if IE 8]> <html class="ie ie8" lang="zh-CN"> <![endif]-->
<!--[if IE 9 ]> <html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="zh-CN">
<!--<![endif]-->
<head  runat="server" id="head1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<!-- 清除浏览器默认样式 -->
	<link rel="stylesheet" type="text/css" href="/Style/reset.css">
	<link rel="stylesheet" type="text/css" href="/Style/leftcon.css">
</head>
<body>
    <form id="form1" runat="server">
       <div style="height:300px;overflow:auto;">
        <asp:CheckBoxList ID="cblItem" runat="server" RepeatColumns="4" CssClass="ItemSelecttable">
           
        </asp:CheckBoxList>

       </div>
           <div class="text-c">
            <asp:Button ID="btnOK" runat="server" Text="确定" OnClick="btnOK_Click" CssClass="darkred recordbtnsave"/>
        </div>    
    </form>
</body>
