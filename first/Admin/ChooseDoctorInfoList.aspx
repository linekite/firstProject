<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseDoctorInfoList.aspx.cs"
    Inherits="Chm.Web.Admin.CheckDoctorInfoListE" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/main.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Js/sdmenu.js" type="text/javascript"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js" type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            //查询检查
            $("#<%=btnSearch.ClientID %>").click(function () {
                return CheckQueryText($("#<%=txtDrName.ClientID %>").val());
            });
        });
    </script>
</head>
<body style="background: #fff;">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label">
                             <Chy:XLabel ID="lbDrNameTag"  Text="姓名" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtDrName" runat="server" class="inputtext"></Chy:XTextBox>
                        </td>
                        <td class="input">
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvDoctor" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="DoctorId" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="5" Width="100%">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="24px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                选择
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:RadioButton ID="rbtSelItem" GroupName="SelItem" runat="server" onclick="Select(this)" />
                                 <span style="display:none"><%# Eval("DoctorName")%></span>
                                 <span style="display:none"><%# Eval("DoctorId")%></span>
                                 <span style="display:none"><%# Eval("Mobile")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            <ItemTemplate>
                                    <span style="text-decoration: underline">
                                        <%# Eval("DoctorName")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="WorkId" HeaderText="工号"></asp:BoundField>
                        <asp:TemplateField HeaderText="职务">
                            <ItemTemplate>
                                <%# ShowPosition(Eval("Position"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrgName" HeaderText="工作单位"></asp:BoundField>
                        <%--<asp:TemplateField HeaderText="状态" Visible="false">
                            <ItemTemplate>
                                <%# ShowState(Eval("OrgName"))%>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td class="buttons" colspan="2" style="text-align: center">
                <input id="Button2" type="button" value="确定"  class="button" onclick="returnValue();"/>
                <input  id="Button1" class="button" type="button" value="返回" onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
  
    </form>
    <script type="text/javascript">
        function Select(o) {
            var gv = document.getElementById("gvDoctor");
            var Inputs = gv.getElementsByTagName("Input");
            for (i = 0; i < Inputs.length; i++) {
                if (Inputs.item(i).type == "radio") {
                    Inputs.item(i).checked = false;
                }
            }
            o.checked = true;
        }

        function returnValue() {
            var Begindex = window.location.href.indexOf("Type=");
            var EndIndex = window.location.href.indexOf("&rnt");
            var Type = "";
            if (Begindex > 0 && EndIndex > 0) {
                Type = window.location.href.substring(Begindex, EndIndex);
            }
            var spans = $(":radio:checked").siblings("span");
            var obj = {
                name: $(spans[0]).text(),
                id: $(spans[1]).text(),
                Mobile: $(spans[2]).text(),
                Ptype: Type
            };
            parent.setValue(obj);
            return "-1";
        }
    </script>
</body>
</html>
