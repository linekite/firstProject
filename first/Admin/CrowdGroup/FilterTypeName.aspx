<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilterTypeName.aspx.cs"
    Inherits="Chm.Web.Admin.CrowdGroup.FilterTypeName" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="/CSS/main.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Js/sdmenu.js" type="text/javascript"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td>
                <div class="con">
                    <div id="tagContent">
                        <div class="tagContent selectTag" id="tagContent0">
                            <table border="0" cellspacing="0" cellpadding="0" class="addformcontainer">
                                <tr>
                                    <td class="warn">
                                        <span style="color: #FF3300">*</span>
                                    </td>
                                    <td class="label">
                                        <Chy:XLabel ID="lblConditionTypeName" Text="" runat="server" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox ID="txtConditionTypeName" AllowEmpty="false" ValidationGroup="RoleVal"
                                            ValidType="String" runat="server" CssClass="inputtext" MaxLength="64" ReadOnly="false">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <input id="btnSubmit" type="button" runat="server" class="button" value="" onclick="GetConditionTypeName()" />
                                        <span class="space"></span>
                                        <input type="button" runat="server" class="button" id="btnReturn" value='返回'
                                            onclick="parent.$('div').dialog('close');" />
                                    </td>
                                    <asp:HiddenField ID="lblType" runat="server" />
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function GetConditionTypeName() {
            var conditionName = document.getElementById("<%=txtConditionTypeName.ClientID %>").value;
            var type = document.getElementById("<%=lblType.ClientID %>").value;
            if (conditionName != "") {
                parent.SetValue(conditionName, type);
            }
            else {
                return alertMsg('请输入名称', '提示', 300, 200, '');
            }
        }
    </script>
    </form>
</body>
</html>
