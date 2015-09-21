<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailEdit.aspx.cs" Inherits="Chm.Web.EmailEdit" %>

<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/CSS/main.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Js/sdmenu.js" type="text/javascript"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/ckeditor/ckeditor.js"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
</head>
<body class="noauto" style="background: #fff;">
    <form id="form1" runat="server">
    <div>
        <Chy:XTextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="400"  MaxLen="256" Height="200"></Chy:XTextBox>
    </div>
    <br />
    <div align="center">
        <Chy:XButton ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" OnClientClick="return chkEmpty();"
            Text="确定" />
        <span class="space"></span>
        <input type="button" class="button" id="btnCancel" onclick="parent.CloseDialg();"
            value='返回' />
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
    function chkEmpty() {
        $("#txtContent").val($("#txtContent").val().replace(/^\s+|\s+$/g, ""));       
        if ($("#txtContent").val() == "") {
            alertMsg('不能为空!', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
            return false;
        }
        else {
            
            return true;
        }
    }
</script>
