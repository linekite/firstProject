<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HMUpLoad.aspx.cs" Inherits="Chm.Web.Admin.HealthInformation.HMUpLoad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="../../Styles/base3.9.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/sp4.css" />
    <script type="text/javascript" src="/Script/jquery-1.8.3.min.js"></script>
</head>
<script language="javascript" type="text/javascript">
    var XmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    function Success(data) {
        if (data != null) {
            var list = data.split('|')
            var sUrl = "HMUpLoad.aspx?oname=" + escape(list[0]) + "&nname=" + escape(list[1]) + "&size=" + escape(list[2]) + "&type=<%=Type %>&DateJkzxID=<%=jkzxids %>&Jkid=<%=JkzxID %>&RefreshID=<%=refreshID %>&IsAuidt=<%=IsAuidt %>";
            XmlHttp.open("POST", sUrl, false);
            XmlHttp.send();
            if (XmlHttp.readyState == 4) {

            }
        }
    }
    function isHaveFile() {
        document.getElementById("<%=lMsg.ClientID%>").innerHTML = "";
        if ($('#<%=fl.ClientID%>').val() == '') {
            alert("请选择文件");
            return false;
        }
        //$('#<%=lMsg.ClientID%>').text('');
        //document.getElementById("<%=lMsg.ClientID%>").innerText = "";
        return true;
    }
    function updateIsSave()
    {
        $('#<%=hdIsSave.ClientID%>').val('0');
        
        
    }
</script>
<body>
    <form id="form1" runat="server">
    <div id="Jkzz">
        <div class="sf_cont">       
            <table cellpadding="0" cellspacing="0" class="zz_detiall" width="100%" align="center">
                <tr>
                    <td>
                        健康杂志期数：<asp:Label ID="lblQS" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                    <td align="center" valign="top" style="width:100%;height:50px;">
                       <%-- <object id="SLPlug" data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                            width="100%" height="275">
                            <param name="source" value="FileUpload.xap" />
                            <param name="onerror" value="onSilverlightError" />
                            <param name="background" value="white" />
                            <param name="minRuntimeVersion" value="3.0.40818.0" />
                            <param name="autoUpgrade" value="true" />
                            <param name="InitParams" value="<%=InitSL %>" />
                            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=3.0.40818.0" style="text-decoration: none;">
                                <img src="http://go.microsoft.com/fwlink/?LinkId=108181" alt="获取 Microsoft Silverlight"
                                    style="border-style: none" />
                            </a>
                        </object>--%>
                        <asp:FileUpload ID="fl" runat="server" />
                        <asp:Button ID="btnUpload" runat="server" Text="上传" Width="50" OnClick="btnUpload_Click"  OnClientClick="return isHaveFile()"/> 
                      <%--  <asp:Literal ID="lMsg" runat="server"></asp:Literal>     --%>
                        &nbsp;&nbsp;&nbsp;<span ID="lMsg" runat="server"></span>                 
                    </td>
                </tr>
              
            </table>
        </div>
        <div class="sf_l_bbg">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td align="center" valign="top">
                    <%--<input type="button" class="button" id="Button1" value="关闭" onclick="parent.$('div').dialog('close');" />--%>
                  <Chy:XButton ID="btnCancel" runat="server" Text="关闭" CssClass="button" OnClick="btnCancel_Click"  OnClientClick="updateIsSave()" />
                    <asp:HiddenField ID="hdIsSave" runat="server"  Value="1"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
