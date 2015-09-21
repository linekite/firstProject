<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckClassSelectM.aspx.cs"
    Inherits="Chm.Web.Admin.Checkup.CheckClassSelectM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>

    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>

    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/common.js" type="text/javascript"></script>
    <script src="/Js/resouces-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script> 


</head>
<body class="noauto" style="background:#fff">
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
                    PageSize="5" Width="100%" OnBindCstm="gvReport_BindCstm" OnRowDataBound="gvCheckClass_RowDataBound">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="24px" ItemStyle-CssClass="check" HeaderStyle-CssClass="check">
                            <HeaderTemplate>
                                <input id="chkSelAll" type="checkbox"/>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckClass" runat="server" />
                                <asp:Label ID="LabclassID" runat="server" Text='<%# Eval("classID") %>' Style="display: none"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="className" HeaderText="项目名称"></asp:BoundField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <%-- 选择--%>
                                内容
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabclassContent" runat="server" Text=''></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Clinical" HeaderText="临床意义"></asp:BoundField>
                        <asp:BoundField DataField="RePrice" HeaderText="参考价格"></asp:BoundField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    </br>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td class="buttons" colspan="2" style="text-align: center">
                <asp:Button ID="btnSubmit" runat="server" Text="确定" CssClass="button" OnClick="btnSubmit_Click" />
                <input id="btnClose" class="button" type="button" value="返回"
                    onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" language="javascript">
        $("#chkSelAll").click(function () {
            $("#<%=gvCheckClass.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"));
        });
    </script>
    </form>
</body>
