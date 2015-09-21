<%@ Page  Language="C#" AutoEventWireup="true" CodeBehind="CheckClassSelect.aspx.cs"
    Inherits="Chm.Web.Admin.Checkup.CheckClassSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link href="../../Styles/base.am.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
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
<style>
            .button {
    background: url("/App_Themes/default/images/sf_sg.gif") no-repeat scroll center top transparent;
    border: 0 none;
    cursor: pointer;
    font-size: 12px;
    height: 25px;
    line-height: 25px;
    width: 54px;
}
</style>
<script type="text/javascript">
    function alertMsg(title, obj, w, h, i) {
        alert(title);
    }
</script>

</head>
<body class="noauto" >
    <form id="form1" runat="server">
    </br>
    <table cellpadding="0" cellspacing="0" border="0" width="350px">
        <tr>
            <td class="label">
                <Chy:XLabel ID="lblCheckClass" runat="server"></Chy:XLabel>
            </td>
            <td class="input">
                <Chy:XTextBox ID="txtCheckClass" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
            </td>
            <td class="input">
                <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table> 
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvCheckClass" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="classID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="5"
                    PageSize="5" Width="100%" OnBindCstm="gvReport_BindCstm">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                               选择
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="rbtSelItem" runat="server" />
                                <asp:Label ID="LabclassID" runat="server" Text='<%# Eval("classID") %>' Style="display: none"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="className" HeaderText="项目名称"></asp:BoundField>
                        <asp:BoundField DataField="depName" HeaderText="科室名称"></asp:BoundField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    </br>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td class="buttons" colspan="2" style="text-align: center">
                <asp:Button ID="btnSubmit" runat="server" Text="确定"  CssClass="button" OnClick="btnSubmit_Click"/> 
                <input  id="btnClose" class="button" type="button" value="返回" onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
    </form>
</body>

