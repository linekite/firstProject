<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="FollowUPAdd.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.FollowUPAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
<script type="text/javascript">
    function backPage() {
       
        if ('<%= Chm.Web.RmomsUnits.GetRequestParameterToInt32("Mode") %>' == 0) {
            window.location = 'HealthPlanPersonEdit.aspx?PlanID=<%= Chm.Web.RmomsUnits.GetRequestParameterToInt32("PlanID") %>';
        }
        if ('<%= Chm.Web.RmomsUnits.GetRequestParameterToInt32("Mode") %>' == 1) {
             window.location = 'HealthPlanEdit.aspx?PlanID=<%= Chm.Web.RmomsUnits.GetRequestParameterToInt32("PlanID") %>';
        }
    }
    ///焦点落到“主要健康问题”时，焦点转移。
    function OtherControlfocus() {
        document.getElementById("<%=btnCancel.ClientID%>").focus();
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
 <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <div>&nbsp;</div> 
    <table class="sf_search" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td class="warn">
                </td>
                <td class="label">
                    完成状态：
                </td>
                <td class="input">
                    <asp:DropDownList runat="server" ID="dplStatus" Width="134px">
                        <asp:ListItem Value="0">计划</asp:ListItem>
                        <asp:ListItem Value="1">已完成</asp:ListItem>
                        <asp:ListItem Value="2">取消</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="warn">
                </td>
                <td class="label">
                    随访日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="dpFollowTime" runat="server" ></Chy:XDatePicker>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label">
                    随访医生：
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtDoctor" MaxLength="30" runat="server" CssClass="inputtext" ></Chy:XTextBox>
                </td>
                <td class="warn">
                    <span class="red">*</span>
                </td>
                <td class="label">
                    计划随访日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="dpPlanTime" runat="server" ></Chy:XDatePicker>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label" valign="top">
                    主要健康问题：
                </td>
                <td class="input" valign="top" colspan="4">
                    <%--<lable id="labHealthProblem" runat="server"></lable>--%>
                    <asp:TextBox ID="txtSummarize" Rows="5" TextMode="MultiLine" runat="server" MaxLen="2048"
                             Width="380px" CssClass="inputarea" onfocus="OtherControlfocus()" Text=""></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warn">
                &nbsp;&nbsp;
                </td>
                <td class="label" valign="top">
                    随访目的：
                </td>
                <td class="input" valign="top" colspan="4">
                    <Chy:XTextBox ID="txtFollowAim" runat="server" CssClass="inputarea" TextMode="MultiLine"
                        MaxLen="2000" Style="width: 380px; height: 80px" Rows="5"></Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label" valign="top">
                    随访结果：
                </td>
                <td class="input" valign="top" colspan="4">
                    <Chy:XTextBox ID="txtFollowResult" runat="server" CssClass="inputarea" TextMode="MultiLine"
                        MaxLen="2000" Style="width: 380px; height: 80px" Rows="5"></Chy:XTextBox>
                </td>
            </tr>
            <tr><td colspan="6"></td></tr>
            <tr>
                <td colspan="6" align="center">
                    <Chy:XButton ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                        Text="保存" />
                    <span class="space"></span>
                    <input type="button" class="button" id="btnCancel" runat="server" onclick="backPage();"
                        value="返回" />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
