<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteOrEditjkzxFiles.aspx.cs"   Inherits="Chm.Web.Admin.HealthInformation.DeleteOrEditjkzxFiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <link href="../../Styles/base3.9.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/sp4.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%if (Types == "delete")
      {%>
    <div class="sf_layout">
        <div class="sf_cont">
            <table cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td class="label" style="padding: 80px 0px 30px 35px;">
                        <span>您确定删除杂志内容
                            <Chy:XLabel CssClass="red" runat="server" ID="lblDelete"></Chy:XLabel>吗?</span>
                    </td>
                </tr>
                <tr>
                    <td class="buttons" align="center">
                        <asp:Button ID="btnDelete" runat="server" Text="确定" CssClass="button" OnClick="btnDelete_Click" />
                        <span class="space"></span>
                        <input type="button" class="button" value="取消" onclick="parent.$('div').dialog('close');" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%}
      else
      { %>
    <div class="sf_layout">
        <div class="sf_cont">
            <table  border="0" cellspacing="0" cellpadding="0" style="margin:50px 0 60px 0px; " align="center">
                <tr>
                    <td class="label">
                       <strong>标题：</strong> 
                    </td>
                    <td class="input">
                        <Chy:XTextBox CssClass="inputtext" runat="server" ID="txtTitle" Width="250px"></Chy:XTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                      <strong>  内容</strong>：
                    </td>
                    <td class="input">
                        <Chy:XLabel ID="lblContetn" runat="server"></Chy:XLabel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="buttons"  align="center">
                        <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="button" OnClick="btnSave_Click" />
                        <span class="space"></span>
                        <input type="button" class="button" value="取消" onclick="parent.$('div').dialog('close');" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%} %>
    </div>
    </form>
</body>
</html>

