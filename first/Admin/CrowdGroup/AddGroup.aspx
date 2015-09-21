<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGroup.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.AddGroup" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
<body class="noauto">
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
                                        <Chy:XLabel ID="lblGroupName" Text="" runat="server" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox ID="txtGroupName" AllowEmpty="false" ValidationGroup="RoleVal" ValidType="String"
                                            runat="server" CssClass="inputtext" MaxLength="64" ReadOnly="false">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <%--<Chy:XButton ID="btnUpdate" runat="server" Text="修改"  CssClass="button"
                                            OnClick="btnUpdate_Click" />--%>
                                        <input id="btnSubmit" type="button" runat="server" class="button" value="" onclick="GetGroupName()" />
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
        function GetGroupName() {
            var groupName = document.getElementById("<%=txtGroupName.ClientID %>").value;
            var type = document.getElementById("<%=lblType.ClientID %>").value;
            if (groupName != "") {
                parent.SetValue(groupName, type);
            }
            else {
                return alertMsg('请输入分组名称', '提示', 300, 200, '');
            }
        }

    </script>
    </form>
</body>
</html>
