<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberInfo.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.MemberInfo" %>

<%@ Register TagPrefix="cc1" Namespace="Chy.UI.Controls" %>
<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../Styles/commonremp.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#tbNormal").css("display", "none");
            $("#btnAdvancedSearch").click(function () { 
                $("#tbAdvance").css("display", "block");
                $("#tbNormal").css("display", "none");
                $("#txtMode").val("1");
            });
            $("#btnGoNormal").click(function () {
                $("#tbAdvance").css("display", "none");
                $("#tbNormal").css("display", "block");
                $("#txtMode").val("0");
            });


        });

        function contentfieldkeydown() {
            if (event.keyCode == 13) {
                document.getElementById("<%=btnQuery.ClientID %>").click();
                event.returnValue = false;
            }
        }
        function ContentClick() {
            document.getElementById("<%=btnQuery.ClientID %>").click();
        }

        alertMsg = function (msg, title, width, height, url) {
            alert(msg);
            return false;
        }
    </script>
</head>
<body class="noauto" style="background: #fff;">
    <form id="form1" runat="server">
    <%--    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <div style="width: 98%; height: 330px; overflow: auto;">
        <div onkeydown="contentfieldkeydown()">
            <table cellpadding="0" cellspacing="0" width="100%" id="tbAdvance" class="healthPanel">
                <tr>
                    <td class="label">
                        <Chy:XLabel ID="lblname" runat="server" Text="姓名"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtPatientNameQuery" CssClass="inputtext" runat="server"></Chy:XTextBox>
                    </td>
                    <td class="label">
                        <Chy:XLabel ID="lblMemberID" runat="server" Text="会员卡号"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtMemberID" CssClass="inputtext" runat="server"></Chy:XTextBox>
                    </td>
                    <td class="input">
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <Chy:XLabel ID="lblCardNo" runat="server" Text="证件号码"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtCardNO" CssClass="inputtext" runat="server"></Chy:XTextBox>
                    </td>
                    <td class="label">
                        <Chy:XLabel ID="lblsex" runat="server" Text="性别"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XCategoryList CssClass="secltwidth" ID="dropSex" runat="server" CategoryId="2">
                        </Chy:XCategoryList>
                    </td>
                    <td class="input">
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <Chy:XLabel ID="lblOrg" runat="server" Text="监护单位"></Chy:XLabel>
                    </td>
                    <td class="input" colspan="3">
                        <Chy:XDropDownList ID="dropOrg" Width="430px" runat="server" AutoPostBack="true">
                        </Chy:XDropDownList>
                        <asp:CheckBox ID="chkIsIncludeSelf" Checked="true" Text="包含子单位" runat="server" AutoPostBack="true" />
                    </td>
                    <td class="input">
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <Chy:XLabel ID="lbMemberServiceItemTag" runat="server" Text="监护类型:"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XCategoryList ID="dropMemberServiceItem" runat="server" CategoryId="20">
                        </Chy:XCategoryList>
                    </td>
                    <td class="label">
                        <Chy:XLabel ID="lbMemberServiceStatus" runat="server" Text="服务状态"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XDropDownList ID="dropMemberServiceStatus" runat="server">
                        </Chy:XDropDownList>
                    </td>
                    <td class="input">
                        <input id="search" type="button" class="button" value='<%=Chy.Web.Resource.GetString("Remp_Search")%>'
                            onclick="ContentClick()" />
                        <Chy:XButton runat="server" CssClass="button" ID="btnQuery" Style="display: none"
                            OnClick="btnQuery_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <table width="100%" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td>
                    <cc1:XGridView ID="gvPatient" AutoGenerateColumns="false" Width="100%" BorderStyle="Solid"
                        DataKeyNames="PatientID" CssClass="zebratable" AllowPaging="true" runat="server"
                        PagerSettings-PageButtonCount="8" PageSize="8" OnBindCstm="gvPatient_BindCstm"
                        OnRowDataBound="gvPatient_RowDataBound" OnRowCommand="gvPatient_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="PatientName">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblsel" CommandName="CmdSel" CommandArgument='<%# Eval("PatientID")+"|"+Eval("OrgName")+"|"+Eval("PatientSex")+"|"+Eval("PatientName")%>'
                                        runat="server">
                                       <%# GetMemberName(Eval("PatientName"))%>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PatientSex">
                                <ItemTemplate>
                                    <%# GetMemberSex(Eval("PatientSex"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="年龄">
                                <ItemTemplate>
                                    <%# GetAge((DateTime?)Eval("Birthday"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MemberID" HeaderText="会员卡号" />
                            <asp:BoundField DataField="OrgName" HeaderText="Monitoring Unit" SortExpression="OrgName " />
                        </Columns>
                    </cc1:XGridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
