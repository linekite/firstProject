<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="HealthPlanPerson.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.HealthPlanPerson" %>

<%@ Import Namespace="Chy.UI.Framework" %>
<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

        //个人保健计划
        //检查结束时间
        function checkTime() {
            var StartTime = $.trim($("#<%=txtStartTime.ClientID %>").val());
            var EndTime = $.trim($("#<%=txtEndTime.ClientID %>").val());

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime);
                var dateEd = new Date(EndTime);
                if (dateSt > dateEd) {
                    // alertMsg('结束时间不能大于开始时间', '系统提示', 400, 200, '');
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }
        $(function () {

            //            $(":header").text('保健计划制定');
            $('#btnAdd').click(function () {
                location.href = 'HealthPlanPersonAdd.aspx?_pi=<%=MemberManager.SelectedId %>';
            });

            $("#chkSelAll").click(function () {
                $("#<%=gvCheckItem.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"))
            });


            $('#<%=btnDelete.ClientID %>').click(function () {
                if ($('#<%=gvCheckItem.ClientID %> [type=checkbox]:checked').length < 1) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    // alertMsg('至少选择一条数据', '系统提示', 400, 200, '');
                    return false;
                }
                return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);

            });
        });

      

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <%--个人保健计划 Start--%>
    <%-- <div class="h_corner">--%>
    <%--<table width="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
<td class="p_c_cleft" width="7">&nbsp;</td>
<td class="p_c_ccont">--%>
    <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel" align="center"
        style="margin-bottom: 10px">
        <tr>
            <td width="30%">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label">
                            计划标题：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtPlanTitle" runat="server" CssClass="inputtext serinput">
                            </Chy:XTextBox>
                        </td>
                        <td class="label">
                            计划状态：
                        </td>
                        <td class="input">
                            <Chy:XDropDownList ID="ddlStatus" runat="server" CssClass="secltwidth ">
                            </Chy:XDropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="input" style="text-align: left">
                <Chy:XButton ID="btnSearch" runat="server" Text='查询' CssClass="button" OnClick="btnSearch_Click"
                    OnClientClick="return checkTime();" />
                <input id="ipAdvancedSearch" type="button" class="gj_button" value='高级查询' />
            </td>
            <td class="add" style="text-align: right">
                <input type="button" class="addbutton" value="新增" id="btnAdd" />
                <span style="width: 3%">&nbsp;</span>
                <Chy:XButton ID="btnDelete" runat="server" Text='删除' CssClass="delbutton" OnClick="btnDelete_Click" />
            </td>
        </tr>
    </table>
    <Chy:XGridView ID="gvCheckItem" runat="server" CssClass="zebratable" AllowPaging="true"
        Width="100%" DataKeyNames="PlanID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
        PageSize="10" OnBindCstm="gvCheckItem_BindCstm" OnRowDataBound="gvCheckItem_RowDataBound"
        HorizontalAlign="Center">
        <columns>
            <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                <HeaderTemplate>
                    <input id="chkSelAll" type="checkbox" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelItem" name='chk' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="true" ItemStyle-Width="120px" HeaderText="计划标题">
                <ItemTemplate>
                    <%#Eval("Title").ToString().Length > 10 ? Eval("Title").ToString().Substring(0, 10) + "..." : Eval("Title").ToString()%>
                </ItemTemplate>
            </asp:TemplateField>                  
            <%--<asp:BoundField DataField="ReLower" HeaderText="年龄"></asp:BoundField>--%>
            <asp:TemplateField ShowHeader="true" HeaderText="计划开始日期">
                <ItemTemplate>
                    <%# Convert.ToDateTime(Eval("BeginTime")).ToString("yyyy-MM-dd")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="true" HeaderText="计划结束日期">
                <ItemTemplate>
                    <%# Convert.ToDateTime(Eval("EndTime")).ToString("yyyy-MM-dd")%>
                </ItemTemplate>
            </asp:TemplateField>
                <asp:TemplateField ShowHeader="true" HeaderText="创建日期">
                <ItemTemplate>
                    <%# Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                        CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReport_Command" Text="查看"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="修改">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                        CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReport_Command" Text="修改"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </columns>
    </Chy:XGridView>
    <div id="advancedSearchDiv" title='<%=Chy.Web.Resource.GetString("Remp_divHeaderAdvQuery") %>'>
        <table cellpadding="0" cellspacing="0" class="searchPanel">
            <tr>
                <td class="label">
                    计划标题：
                </td>
                <td class="input" colspan="4">
                    <Chy:XTextBox ID="txtPlanTitle1" runat="server" Width="230" class="inputtext">
                    </Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td class="label">
                    开始日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="txtStartTime" Width="130" runat="server" DateFmt="yyyy-MM-dd">
                    </Chy:XDatePicker>
                </td>
            </tr>
            <tr>
                <td class="label">
                    结束日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="txtEndTime" Width="130" runat="server" DateFmt="yyyy-MM-dd">
                    </Chy:XDatePicker>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="input">
                    <input type="button" id="ipAdvQuery" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Search") %>'
                        onclick="return checkTime();" />
                    &nbsp;&nbsp;
                    <input type="button" id="ipClose" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Close") %>' />
                </td>
            </tr>
        </table>
    </div>
    <asp:Button ID="btnAdvQuery" runat="server" Text="高级查询" CssClass="button" Style="display: none;"
        OnClick="btnAdvQuery_Click" />
    <%--        </td>
<td class="p_c_cright" width="7">&nbsp;</td>
</tr>

</table>--%>
    <%--<table width="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
<td class="p_c_bleft" width="7" height="7">&nbsp;</td>
<td class="p_c_bcont">&nbsp;</td>
<td class="p_c_bright" width="7">&nbsp;</td>
</tr>

</table>--%>
    <%--  </div>--%>
    <%--个人保健计划 End--%>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            //个人保健计划
            $("#ipClose").click(function () { $("#advancedSearchDiv").dialog("close"); })

            $("#ipAdvancedSearch").click(function () {
                $("#advancedSearchDiv").dialog("open");
            });

            $("#advancedSearchDiv").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 450,
                position: 'top',
                autoHeight: true,
                closeOnEscape: false
            });

            $("#advancedSearchDiv").parent().appendTo($("form:first"));

            $("#popDivChoose").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 450,
                autoHeight: true,
                closeOnEscape: false
            });
            $("#ipAdvQuery").click(function () {
                $("#advancedSearchDiv").dialog("close");
                $("#<%=btnAdvQuery.ClientID%>").click();

            });

        })  
    </script>
</asp:Content>
