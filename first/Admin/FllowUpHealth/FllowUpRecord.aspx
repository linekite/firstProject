<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="FllowUpRecord.aspx.cs" Inherits="Chm.Web.Admin.FllowUpHealth.FllowUpRecord" %>

<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="../../../Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../../Js/jquery.autocomplete.js" type="text/javascript"></script>
    <style type="text/css">
        .hiden
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr align="center">
                        <td class="label" style="display: none;">
                            <Chy:XLabel ID="lblOrgnazation" Text="所属单位：" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input" style="display: none;">
                            <Chy:XTextBox ID="txtOrgnazation" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="XLabel2" Text="姓名：" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtPatientName" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblStartTime" Text=" 随访开始日期：" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="dpStartTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblEndTime" Text=" 随访结束日期：" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="dpEndTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <%-- <td class="label">
                            <Chy:XLabel ID="XLabel1" Text=" 随访类别:" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDropDownList ID="ddlCategory" runat="server">
                                <asp:ListItem Value="-1" Selected="True" Text="全部"></asp:ListItem>
                                <asp:ListItem Value="1" Text="已随访"></asp:ListItem>
                                <asp:ListItem Value="0" Text="未随访"></asp:ListItem>
                            </Chy:XDropDownList>
                        </td>
                        --%>
                        <%--  <td class="label">
                            <Chy:XLabel ID="lblStartTime" runat="server" Text="随访开始日期:"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpStartTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblEndTime" runat="server" Text="随访结束日期:"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpEndTime" runat="server"></Chy:XDatePicker>&nbsp;&nbsp;
                        </td>--%>
                        <%--<td>
                            <Chy:XLabel ID="lblType" Text="随访类别:" runat="server"></Chy:XLabel>
                        </td>
                        <td>
                            <Chy:XDropDownList ID="ddlType" runat="server">
                                <asp:ListItem Selected="True" Value="-1" Text=" 全部 "></asp:ListItem>
                                <asp:ListItem Value="1" Text="已随访"></asp:ListItem>
                                <asp:ListItem Value="0" Text="未随访"></asp:ListItem>
                            </Chy:XDropDownList>
                        </td>--%>
                        <td class="input">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Chy:XButton ID="btnSearch" runat="server" Text="查询"
                                CssClass="button" OnClick="btnSearch_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <Chy:XButton ID="btnAdd" runat="server" Text="新增" CssClass="button" OnClick="btnAdd_Click"  style=" display:none;"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvFllowUpRecord" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="HealthFUID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="所属单位" ItemStyle-CssClass="hiden" HeaderStyle-CssClass="hiden">
                            <ItemTemplate>
                                <asp:Label ID="lblOrgnazation" runat="server" Text='<%# Eval("OrgName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            <ItemTemplate>
                                <a onclick='return aClick(<%#Eval("PatientID") %>)' href='javascript:;'>
                                    <%# Eval("PatientName") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="会员卡号">
                            <ItemTemplate>
                                <asp:Label ID="lblPatientNo" runat="server" Text='<%# Eval("CradNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="联系电话">
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="未随访次数">
                            <ItemTemplate>
                                <asp:Label ID="lblWaitFllowCount" runat="server" Text='<%# Eval("WaitFllowUpCount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="已随访次数" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Label ID="lblHasFllowCount" runat="server" Text='<%# Eval("HasFllowUpCount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <a onclick='return GoFill(<%# Eval("HasFllowUpCount") %>,<%# Eval("WaitFllowUpCount") %>,<%#Eval("PatientID") %>,<%# Eval("HealthFUID") %>,<%# Eval("Status") %>,<%#Eval("FLType") %>)'
                                    href='javascript:;'>
                                    <%# GetOperation(Eval("HasFllowUpCount"),Eval("WaitFllowUpCount")) %>
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            //查询检查
            $("#<%=btnSearch.ClientID %>").click(function () {
                if (checkTime() && CheckQueryText($("#<%=txtOrgnazation.ClientID %>").val()) && CheckQueryText($("#<%=txtPatientName.ClientID %>").val())) {
                    return true;
                }
                else {
                    return false;
                }
            });

            //检查结束时间
            function checkTime() {
                var StartTime = $.trim($("#<%=dpStartTime.ClientID %>").val()).replace(/-/g, '/').split('/');
                var EndTime = $.trim($("#<%=dpEndTime.ClientID %>").val()).replace(/-/g, '/').split('/');

                if (EndTime.length != 0 && StartTime.length != 0) {
                    var dateSt = new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
                    var dateEd = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                    if (dateSt > dateEd) {
                        alertMsg('随访结束日期不能小于随访开始日期', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                        return false;
                    }
                }
                return true;
            }
        })

        function TagClick() {
            window.location = 'FllowUpToday.aspx?rft=' + Math.random;
        }

        function TagClick1() {
            window.location = 'HasFllowUp.aspx?rft=' + Math.random;
        }

        function TagClick2() {
            window.location = 'FllowUpRecord.aspx?rft=' + Math.random;
        }
        function aClick(_pi) {
            var url = '/hc/Admin/FllowUpHealth/PersonalFllowUp.aspx?PatientID=' + _pi;
            clientUnity.redirectToPersional(_pi, url);
            return false;
        }

        function GoFill(hasFollowCount, waitFollowupCount, _pi, id, status, type) {
            var param = "";
            if (hasFollowCount == 0 && waitFollowupCount == 0) {
                param = id + '|' + _pi + '|' + status + "|" + "0" + "|" + type;
            } else {
                param = id + '|' + _pi + '|' + status + "|" + "1" + "|" + type;
            }
            var url = '/hc/Admin/FllowUpHealth/PersonFllowupRecords.aspx?parms=' + escape(param);
            clientUnity.redirectToPersionalByMenuId(_pi, url, 20015);
            return false;
        }
    </script>
</asp:Content>
