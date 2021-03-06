﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="FllowUpToday.aspx.cs" Inherits="Chm.Web.Admin.FllowUpHealth.FllowUpToday" %>

<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css" >
        .hiden
        {
          display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr align="center">
                        <td class="label" style=" display:none;">
                            <Chy:xlabel id="lblOrgnazation" text="所属单位：" runat="server"></Chy:xlabel>
                        </td>
                        <td class="input" style=" display:none;">
                            <Chy:xtextbox id="txtOrgnazation" runat="server" class="inputtext" maxlength="64"></Chy:xtextbox>
                        </td>
                        <td class="label">
                            <Chy:xlabel id="XLabel1" text="姓名：" runat="server"></Chy:xlabel>
                        </td>
                        <td class="input">
                            <Chy:xtextbox id="txtPatientName" runat="server" class="inputtext" maxlength="64"></Chy:xtextbox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblType" runat="server" Text="类别："></Chy:XLabel>
                        </td>
                        <td>
                            <Chy:XDropDownList ID="xddlType" runat="server">
                                <asp:ListItem Text="请选择" Value="-1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="体检" Value="1"></asp:ListItem>
                                <asp:ListItem Text="住院" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="其它" Value="3"></asp:ListItem>
                            </Chy:XDropDownList>
                        </td>
                        <td class="label">
                            <Chy:xbutton id="btnSearch" runat="server" text="查询" cssclass="button" onclick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:xgridview id="gvTodayFllowUp" runat="server" cssclass="zebratable" allowpaging="true"
                    autogeneratecolumns="false" datakeynames="HealthFUID" pagersettings-pagebuttoncount="8"
                    pagesize="10" width="100%">
                                <Columns>
                                   <asp:TemplateField HeaderText="所属单位" ItemStyle-CssClass="hiden" HeaderStyle-CssClass="hiden">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrgnazation" runat="server" Text='<%# Eval("OrgName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="姓名">
                                        <ItemTemplate>
                                            <a onclick='return aClick(<%#Eval("PatientID") %>,0)' href='javascript:;'>
                                            <%# Eval("PatientName")%></a> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="会员卡号">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPatientNo" runat="server" Text='<%# Eval("CradNo")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="联系电话">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="计划随访日期">
                                        <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("PlanTime ")).ToString("yyyy-MM-dd")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="随访类别">
                                        <ItemTemplate>
                                            <asp:Label ID="lblType" runat="server" Text='<%# GetFollowUpType(Eval("FLType"))%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="操作" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                        <%--<a onclick='return aClick(<%#Eval("PatientID") %>,0)'  href='javascript:;'>--%>
                                        <a onclick='return GoFill(<%# Eval("PatientID") %>,<%# Eval("HealthFUID") %>,<%# Eval("Status") %>,<%# Eval("FLType") %>)'  href='javascript:;'>
                                            填写</a> 
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </Chy:xgridview>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            //查询检查
            $("#<%=btnSearch.ClientID %>").click(function () {
                if (CheckQueryText($("#<%=txtOrgnazation.ClientID %>").val()) && CheckQueryText($("#<%=txtPatientName.ClientID %>").val())) {
                    return true;
                }
                else {
                    return false;
                }
            });
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

        function aClick(_pi, _status) {
            var url = '/hc/Admin/FllowUpHealth/PersonalFllowUp.aspx?PatientID=' + _pi + '&status=' + _status;
            clientUnity.redirectToPersional(_pi, url);
            return false;
        }

        function GoFill(_pi, id, status, type) {
            var param = id + '|' + _pi + '|' + status + "|1|" + type;
            var url = '/hc/Admin/FllowUpHealth/PersonFllowupRecords.aspx?parms=' + escape(param);
            clientUnity.redirectToPersionalByMenuId(_pi, url, 20015);
            return false;
        }
    </script>
</asp:Content>
