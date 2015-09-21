<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectGroupUserInfo.aspx.cs"
    Inherits="Chm.Web.Admin.SelectGroupUserInfo" %>

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
      <style type="text/css">
        .hidden{display:none;}
    </style>
</head>
<body>
    <form runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label" nowrap>
                            <Chy:XLabel ID="lblPatientName" runat="server" ></Chy:XLabel>
                        </td>
                        <td class="label" nowrap>
                            <Chy:XTextBox ID="txtPatientName" runat="server"></Chy:XTextBox>
                        </td>
                        <td class="input" nowrap>
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center" nowrap>
        <tr>
            <td nowrap>
                <Chy:XGridView ID="gvSelectGroupUserInfo" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="PatientID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="5" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <%-- <input type="checkbox" id="selectAll" />--%>
                                <asp:CheckBox ID="selectAll" runat="server" onclick="CheckAll(this,'chkSelItem')" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelItem" runat="server" onclick="CheckOne(this)" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PatientName" HeaderText=""></asp:BoundField>
                        <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%# GetPageSex(Eval("PatientSex")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Mobile" HeaderText=""></asp:BoundField>
                        <asp:TemplateField ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:Label ID="patientId" runat="server" Text='<%# Eval("PatientID") %>' style=" display:none"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <Chy:XButton ID="btnSubmit" runat="server" Text="确定" CssClass="button" OnClientClick="back()" />
                <input name="返回" id="btnClose" class="button" type="button" value='返回'
                    onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {

            $("#<%=btnSearch.ClientID %>").click(function () {
                if (CheckQueryText($("#<%=txtPatientName.ClientID %>").val()) == false) {
                    return false;
                }
            });
        });

        function back() {
            var s = "["
            $("#<%=gvSelectGroupUserInfo.ClientID %>").find("tr:gt(0)").each(function () {
                if ($(":checkbox", this).attr("checked")) {
                    s = s + "{\"Name\":" + "\"" + $(this).children("td").eq(1).text() + "\"" + ",\"Sex\":" + "\"" + $(this).children("td").eq(2).text() + "\"" + ",\"Phone\":" + "\"" + $(this).children("td").eq(3).text() + "\"" + ",\"PatientNo\":" + "\"" + $(this).children("td").eq(4).text() + "\"},";
                }
            });
            s = s.replace(/,*$/g, "");
            s = s + "]";
            try {
                window.parent.SetCheckupItem(s);
            }
            catch (err) {

            }
        }

        function CheckAll(chkSelectedAll, chkCheckItemId) {
            var o = document.getElementsByTagName("Input");
            for (i = 0; i < o.length; i++) {
                if (o.item(i).type == "checkbox" && o.item(i).name.indexOf(chkCheckItemId) > 0) {
                    if (chkSelectedAll.checked) {
                        o.item(i).checked = true;
                        o.item(i).parentNode.parentNode.parentNode.className = "GridViewItem";
                    }
                    else {
                        o.item(i).checked = false;
                        o.item(i).parentNode.parentNode.parentNode.className = "dataGridItem";
                    }
                }
            }
        }

        function CheckOne(checkItem) {
            if (checkItem.checked == false) {
                $("#<%=gvSelectGroupUserInfo.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = false;
                return;
            }
            else {
                var o = $("#<%=gvSelectGroupUserInfo.ClientID %> tr:gt(0) :checkbox");
                for (i = 0; i < o.length; i++) {
                    if (o[i].checked == false) {
                        $("#<%=gvSelectGroupUserInfo.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = false;
                        return;
                    }
                }
            }
            $("#<%=gvSelectGroupUserInfo.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = true;
        }
    </script>
    </form>
</body>
</html>
